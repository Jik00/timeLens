import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/core/services/shared_preferences_singleton.dart';
import 'package:timelens/features/profile/domain/entities/profile_entity.dart';
import 'package:timelens/features/profile/domain/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

  final ProfileRepo profileRepo;

  Future<void> updateProfile(ProfileEntity updated) async {
    emit(ProfileLoading()); // show loading indicator

    final result = await profileRepo.updateProfile(updated);
    Prefs.saveLanguage(updated.language); // Save the language preference
    result.fold(
      (failure) => emit(ProfileError(failure.message)),
      (profile) => emit(ProfileLoaded(profile)),
    );
  }
  Future<void> updateProfilePic(ProfileEntity updated, File imgFile) async {
    emit(ProfileLoading()); // show loading indicator

    final result = await profileRepo.updateProfilePic(updated, imgFile);
    result.fold(
      (failure) => emit(ProfileError(failure.message)),
      (profile) => emit(ProfileLoaded(profile)),
    );
  }
}
