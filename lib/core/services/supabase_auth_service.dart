import 'dart:developer';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timelens/core/services/get_it_service.dart';
import 'package:timelens/generated/l10n.dart';

class SupabaseAuthService {
  Future<User> signUpWithEmail({
    required String email,
    required String password,
    required String username,
  }) async {

    try {
      final AuthResponse res = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {'username': username},
      );

      final User user = res.user!;

      return user;
    } on Exception catch (e) {
      log('Error in SupabaseAuthService.signUpWithEmail: ${e.toString()}');
      throw Exception(S().loginError);
    }
  }

  Future<User> signInWithEmail(
      {required String email, required String password}) async {
    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final User user = res.user!;
      return user;
    } on Exception catch (e) {
      log('Error in SupabaseAuthService.signInWithEmail: ${e.toString()}');
      throw Exception(S().loginError);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await supabase.auth.signInWithOAuth(
        OAuthProvider.google,
        scopes: 'openid email profile',
      );
    } on Exception catch (e) {
      log('Error in SupabaseAuthService.signInWithGoogle: ${e.toString()}');
      throw Exception(S().loginError);
    }
  }
  
}
