import 'package:demo_flutter_cursor/core/data/api/authentication_api.dart';
import 'package:demo_flutter_cursor/core/data/api/base_api_exceptions.dart';
import 'package:demo_flutter_cursor/core/data/api/http_client.dart';
import 'package:demo_flutter_cursor/core/data/api/user_api.dart';
import 'package:demo_flutter_cursor/core/data/storage/secured_storage.dart';
import 'package:demo_flutter_cursor/core/domain/models/credentials/credentials.dart';
import 'package:demo_flutter_cursor/core/domain/models/exceptions/authentication_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final authRepositoryProvider = Provider<AuthenticationRepository>(
  (Ref ref) => AuthenticationRepository(
    logger: Logger(),
    authenticationApi: ref.read(authenticationApiProvider),
    storage: ref.read(securedStorageProvider),
    userApi: ref.read(userApiProvider),
    httpClient: ref.read(httpClientProvider),
  ),
);

/// this is an example on how to create an authentication repository using firebase
class AuthenticationRepository {
  final Logger _logger;
  final AuthenticationApi _authenticationApi;
  final SecuredStorage _storage;
  // ignore: unused_field
  final UserApi _userApi;
  final HttpClient _httpClient;

  AuthenticationRepository({
    required Logger logger,
    required AuthenticationApi authenticationApi,
    required SecuredStorage storage,
    required UserApi userApi,
    required HttpClient httpClient,
  }) : _logger = logger,
       _httpClient = httpClient,
       _userApi = userApi,
       _authenticationApi = authenticationApi,
       _storage = storage;

  @override
  Future<void> signupAnonymously() async {
    try {
      _logger.d('Signup anonymously up');
      final credentials = await _authenticationApi.signinAnonymously();
      await _storage.write(value: credentials);
      _httpClient.authToken = credentials.token;
    } on ApiError catch (e) {
      throw SignupException.fromApiError(e);
    } catch (e) {
      throw SignupException(code: 0, message: 'Unknown error $e');
    }
  }

  @override
  Future<void> signup(String email, String password) async {
    try {
      _logger.d('Signing up with $email');
      final credentials = await _authenticationApi.signup(email, password);
      await _storage.write(value: credentials);
      _httpClient.authToken = credentials.token;
    } on ApiError catch (e) {
      throw SignupException.fromApiError(e);
    } catch (e) {
      throw SignupException(code: 0, message: 'Unknown error $e');
    }
  }

  @override
  Future<void> signin(String email, String password) async {
    try {
      _logger.d('Signing in with $email');
      final credentials = await _authenticationApi.signin(email, password);
      await _storage.write(value: credentials);
      _httpClient.authToken = credentials.token;
    } on ApiError catch (e) {
      throw SigninException.fromApiError(e);
    } catch (e) {
      throw SigninException(code: 0, message: '$e');
    }
  }

  @override
  Future<void> recoverPassword(String email) async {
    try {
      await _authenticationApi.recoverPassword(email);
    } on ApiError catch (e) {
      throw RecoverPasswordException.fromApiError(e);
    } catch (e) {
      throw RecoverPasswordException(code: 0, message: '$e');
    }
  }

  @override
  Future<void> signinWithGoogle() async {
    try {
      _logger.d('Signing in with Google');
      final credentials = await _authenticationApi.signinWithGoogle();
      await _storage.write(value: credentials);
      _httpClient.authToken = credentials.token;
    } on ApiError catch (e) {
      throw SigninException.fromApiError(e);
    } catch (e) {
      throw SigninException(code: 0, message: '$e');
    }
  }

  @override
  Future<void> signinWithGooglePlayGames() async {
    try {
      _logger.d('Signing in with Google play games');
      final credentials = await _authenticationApi.signinWithGooglePlay();
      await _storage.write(value: credentials);
      _httpClient.authToken = credentials.token;
    } on ApiError catch (e) {
      throw SigninException.fromApiError(e);
    } catch (e) {
      throw SigninException(code: 0, message: '$e');
    }
  }

  @override
  Future<void> signinWithApple() async {
    try {
      _logger.d('Signing in with Apple');
      final credentials = await _authenticationApi.signinWithApple();
      await _storage.write(value: credentials);
      _httpClient.authToken = credentials.token;
    } on ApiError catch (e) {
      throw SigninException.fromApiError(e);
    } catch (e) {
      throw SigninException(code: 0, message: '$e');
    }
  }

  @override
  Future<void> signinWithFacebook() async {
    try {
      _logger.d('Signing in with Facebook');
      final credentials = await _authenticationApi.signinWithFacebook();
      await _storage.write(value: credentials);
      _httpClient.authToken = credentials.token;
    } on ApiError catch (e) {
      throw SigninException.fromApiError(e);
    } catch (e) {
      throw SigninException(code: 0, message: '$e');
    }
  }

  @override
  Future<void> logout() async {
    _logger.d('Logging out');
    _httpClient.authToken = null;
    await _authenticationApi.signout();
    await _storage.clear();
  }

  @override
  Future<Credentials?> get() => _authenticationApi.get();
}
