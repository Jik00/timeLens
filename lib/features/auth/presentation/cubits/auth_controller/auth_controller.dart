import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:timelens/features/auth/domain/usecases/check_auth_status.dart';
import 'package:timelens/features/profile/domain/entities/profile_entity.dart';
import 'package:timelens/features/profile/domain/repo/profile_repo.dart';

class AuthController extends ChangeNotifier {
  final CheckAuthStatusUseCase _checkAuthStatusUseCase;
  final ProfileRepo _profileRepo;

  AuthStatus _status = AuthStatus.unknown;
  ProfileEntity? _currentProfile;
  String? _userId;

  AuthController(this._checkAuthStatusUseCase, this._profileRepo) {
    _listenToAuthChanges();
  }

  AuthStatus get status => _status;
  ProfileEntity? get currentProfile => _currentProfile;
  String? get userId => _userId;
  bool get isAuthenticated => _status == AuthStatus.authenticated;
  bool get isUnauthenticated => _status == AuthStatus.unauthenticated;
  bool get isUnknown => _status == AuthStatus.unknown;

  void _listenToAuthChanges() {
    _checkAuthStatusUseCase.execute().listen((status) async {
      _status = status;
      status == AuthStatus.authenticated
          ? await _onAuthenticated()
          : await _onUnauthenticated();
      notifyListeners();
    });
  }

  Future<void> _onAuthenticated() async {
    final user = await _checkAuthStatusUseCase.authRepo.getCurrentUser();
    if (user == null) return;

    _userId = user.uId;

    final result = await _profileRepo.getProfile(user.uId);

    debugPrint('AuthController: profile fetch result: $result');

    result.fold(
      (failure) => debugPrint('Profile load failed: $failure'),
      (profile) => _currentProfile = profile,
    );
  }

  Future<void> _onUnauthenticated() async {
    
    final userId = _userId;
    
    if (userId == null) {
      _currentProfile = null;
      return; // nothing to clear
    }
    
    debugPrint('AuthController: user is unauthenticated, clearing Hive profile');

    final result = await _profileRepo.clearCachedProfile(userId);

    debugPrint('AuthController: profile clear result: $result');

    result.fold(
      (failure) => debugPrint('Failed to clear cached profile: $failure'),
      (_) => debugPrint('Cached profile cleared'),
    );

    _userId = null;
    _currentProfile = null;
  }

  // Called from profile edit screen after successful update // profile cubit
  void onProfileUpdated(ProfileEntity updated) {
    _currentProfile = updated;
    notifyListeners();
  }

  Locale get currentLocale {
    final langCode = currentProfile?.language ?? 'en'; // fallback
    return Locale(langCode);
  }
}
