import 'package:demo_flutter_cursor/core/data/api/authentication_api.dart';
import 'package:demo_flutter_cursor/core/domain/models/credentials/credentials.dart';

/// Fake implementation of [AuthenticationApi]
/// This is useful for testing purposes
class FakeAuthenticationApi implements AuthenticationApi {
  Credentials? current;

  @override
  Future<void> init() {
    return Future.value();
  }

  @override
  Future<Credentials> signup(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    current = const Credentials(
      id: 'fake-user-id',
      token: 'fake-user-token-1234567890',
    );
    return current!;
  }

  @override
  Future<Credentials> signin(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    current = const Credentials(
      id: 'fake-user-id',
      token: 'fake-user-token-1234567890',
    );
    return current!;
  }

  @override
  Future<Credentials> signinAnonymously() async {
    await Future.delayed(const Duration(seconds: 1));
    current = const Credentials(
      id: 'fake-user-id-anonymous',
      token: 'fake-user-token-1234567898',
    );
    return current!;
  }

  @override
  Future<void> signout() async {
    current = null;
  }

  @override
  Future<Credentials> signinWithGoogle() async {
    await Future.delayed(const Duration(seconds: 1));
    current = const Credentials(
      id: 'fake-user-id',
      token: 'fake-user-token-1234567890',
    );
    return current!;
  }

  @override
  Future<Credentials> signinWithGooglePlay() async {
    await Future.delayed(const Duration(seconds: 1));
    current = const Credentials(
      id: 'fake-user-id',
      token: 'fake-user-token-1234567890',
    );
    return current!;
  }

  @override
  Future<Credentials> signinWithApple() async {
    await Future.delayed(const Duration(seconds: 1));
    current = const Credentials(
      id: 'fake-user-id',
      token: 'fake-user-token-1234567890',
    );
    return current!;
  }

  @override
  Future<Credentials> signinWithFacebook() async {
    await Future.delayed(const Duration(seconds: 1));
    current = const Credentials(
      id: 'fake-user-id',
      token: 'fake-user-token-1234567890',
    );
    return current!;
  }

  @override
  Future<void> recoverPassword(String email) async {
    await Future.delayed(const Duration(milliseconds: 100));
  }

  @override
  Future<Credentials?> get() {
    return Future.value(current);
  }

  @override
  Future<Credentials> signupFromAnonymousWithGoogle() async {
    await Future.delayed(const Duration(seconds: 1));
    current = const Credentials(
      id: 'fake-user-id',
      token: 'fake-user-token-1234567890',
    );
    return current!;
  }

  @override
  Future<Credentials> signupFromAnonymousWithApple() async {
    await Future.delayed(const Duration(seconds: 1));
    current = const Credentials(
      id: 'fake-user-id',
      token: 'fake-user-token-1234567890',
    );
    return current!;
  }
}
