import 'package:demo_flutter_cursor/core/data/entities/user_entity.dart';
import 'package:demo_flutter_cursor/core/initializer/onstart_service.dart';

abstract class AuthenticationApi implements OnStartService {
  /// Get the current user credentials or null if not connected
  Future<Credentials?> get();

  /// Signup a new user using [email] and [password]
  Future<Credentials> signup(String email, String password);

  /// Signin an existing user using [email] and [password]
  /// If the user is not found, an [SigninException] is thrown
  Future<Credentials> signin(String email, String password);

  /// Signout the current user
  Future<void> signout();

  /// Signin anonymously
  Future<Credentials> signinAnonymously();

  /// Signin with Google account
  /// Requires the [google_sign_in](https://pub.dev/packages/google_sign_in) package
  Future<Credentials> signinWithGoogle();

  /// Signin with Google Play account
  /// Requires the [google_sign_in](https://pub.dev/packages/google_sign_in) package
  Future<Credentials> signinWithGooglePlay();

  /// Signin with Facebook account
  /// Requires the [flutter_facebook_auth](https://pub.dev/packages/flutter_facebook_auth) package
  Future<Credentials> signinWithFacebook();

  /// Signin with Apple account
  Future<Credentials> signinWithApple();

  /// Recover password if user signed up with email/password
  Future<void> recoverPassword(String email);

  /// Sign up with Google and link the account to the current anonymous user.
  /// The anonymous account will now be linked to the Google account.
  /// The user can now sign in with the Google account.
  /// His data will be preserved.
  Future<Credentials> signupFromAnonymousWithGoogle();

  /// Sign up with Apple and link the account to the current anonymous user.
  /// The anonymous account will now be linked to the Apple account.
  /// The user can now sign in his Apple account on another device.
  /// His data will be preserved.
  Future<Credentials> signupFromAnonymousWithApple();
}

class PhoneAlreadyLinkedException implements Exception {
  PhoneAlreadyLinkedException();
}
