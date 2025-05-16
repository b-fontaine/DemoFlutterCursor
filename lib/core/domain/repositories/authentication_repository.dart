import 'package:demo_flutter_cursor/core/domain/models/credentials/credentials.dart';

abstract class AuthenticationRepository {
  Future<void> signupAnonymously();
  Future<void> signup(String email, String password);
  Future<void> signin(String email, String password);
  Future<void> recoverPassword(String email);
  Future<void> signinWithGoogle();
  Future<void> signinWithGooglePlayGames();
  Future<void> signinWithApple();
  Future<void> signinWithFacebook();
  Future<void> logout();
  Future<Credentials?> get();
}
