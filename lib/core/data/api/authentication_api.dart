import 'dart:async';

import 'package:demo_flutter_cursor/core/domain/models/credentials/credentials.dart';
import 'package:demo_flutter_cursor/core/domain/models/exceptions/authentication_exceptions.dart';
import 'package:demo_flutter_cursor/core/initializer/onstart_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final authenticationApiProvider = Provider<AuthenticationApi>(
  (ref) => FirebaseAuthenticationApi(FirebaseAuth.instance),
);

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

class FirebaseAuthenticationApi implements AuthenticationApi {
  final FirebaseAuth _auth;
  User? _user;
  bool hasInit = false;

  FirebaseAuthenticationApi(this._auth);

  @override
  Future<void> init() async {
    _auth.userChanges().listen((event) {
      if (!hasInit) {
        hasInit = true;
      }
      _user = event;
    });
    while (!hasInit) {
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }

  Stream<Credentials?> onAuthStateChange() {
    return _auth.authStateChanges().map((user) {
      if (user == null) {
        return null;
      }
      return Credentials(id: user.uid, token: "");
    });
  }

  @override
  Future<Credentials?> get() async {
    if (_user != null) {
      return Future.value(Credentials(id: _user!.uid, token: ""));
    }
    return null;
  }

  @override
  Future<Credentials> signinAnonymously() {
    return _auth.signInAnonymously().then(
      (value) => Credentials(
        id: value.user!.uid,
        token: value.credential?.token.toString() ?? '',
      ),
      onError: (error) {
        Logger().e("Error while signing in anonymously: $error");
        Logger().e(
          "Please check you enabled anonymous sign-in in Firebase: https://firebase.google.com/docs/auth/flutter/anonymous-auth",
        );
        return error;
      },
    );
  }

  @override
  Future<Credentials> signin(String email, String password) {
    return _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
          (value) => Credentials(
            id: value.user!.uid,
            token: value.credential?.token.toString() ?? '',
          ),
        );
  }

  @override
  Future<void> recoverPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> signout() {
    _user = null;
    return _auth.signOut();
  }

  @override
  Future<Credentials> signup(String email, String password) async {
    if (_auth.currentUser == null) {
      return _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
            (value) => Credentials(
              id: value.user!.uid,
              token: value.credential?.token.toString() ?? '',
            ),
          );
    }
    final credentials = EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    final resultUser = await _auth.currentUser!.linkWithCredential(credentials);
    return Credentials(
      id: resultUser.user!.uid,
      token: resultUser.credential?.token.toString() ?? '',
    );
  }

  @override
  Future<Credentials> signinWithGoogle() async {
    throw UnimplementedError();
  }

  /// Sign up with Google and link the account to the current anonymous user.
  /// The anonymous account will now be linked to the Google account.
  /// The user can now sign in with the Google account.
  /// His data will be preserved.
  @override
  Future<Credentials> signupFromAnonymousWithGoogle() async {
    final googleProvider = GoogleAuthProvider();
    googleProvider.addScope('email');
    final credentials = await _auth
        .currentUser! //
        .linkWithProvider(googleProvider);
    return Credentials(
      id: credentials.user!.uid,
      token: credentials.credential?.token.toString() ?? '',
    );
  }

  @override
  Future<Credentials> signinWithGooglePlay() async {
    throw UnimplementedError();
  }

  @override
  Future<Credentials> signinWithApple() async {
    throw UnimplementedError();
  }

  /// Sign up with Apple and link the account to the current anonymous user.
  /// The anonymous account will now be linked to the Apple account.
  /// The user can now sign in his Apple account on another device.
  /// His data will be preserved.
  @override
  Future<Credentials> signupFromAnonymousWithApple() async {
    final appleProvider = AppleAuthProvider();
    appleProvider.addScope('email');
    return _auth.currentUser!
        .linkWithProvider(appleProvider)
        .then(
          (value) => Credentials(
            id: value.user!.uid,
            token: value.credential?.token.toString() ?? '',
          ),
        );
  }

  @override
  Future<Credentials> signinWithFacebook() async {
    throw UnimplementedError();
  }
}
