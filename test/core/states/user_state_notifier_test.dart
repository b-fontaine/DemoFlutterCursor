import 'package:demo_flutter_cursor/core/data/api/http_client.dart';
import 'package:demo_flutter_cursor/core/data/repositories/authentication_repository.dart';
import 'package:demo_flutter_cursor/core/data/repositories/device_repository.dart';
import 'package:demo_flutter_cursor/core/data/repositories/user_repository.dart';
import 'package:demo_flutter_cursor/core/domain/models/auth/authentication_mode.dart';
import 'package:demo_flutter_cursor/core/domain/models/user/user.dart';
import 'package:demo_flutter_cursor/core/domain/usecases/load_user_use_case.dart';
import 'package:demo_flutter_cursor/core/ui/states/user_state_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/authentication/data/api/auth_api_fake.dart';
import '../../modules/authentication/data/api/user_api_fake.dart';
import '../data/api/storage_api_fake.dart';
import '../data/storage/auth_secured_storage_fake.dart';
import '../device/data/device_api_fake.dart';

void main() {
  group('authRequired AuthenticationMode', () {
    final authRepository = AuthenticationRepository(
      logger: Logger(),
      authenticationApi: FakeAuthenticationApi(),
      storage: FakeAuthSecuredStorage.empty(),
      userApi: FakeUserApi(storageApi: FakeStorageApi()),
      httpClient: HttpClient(baseUrl: ''),
    );

    final fakeStorageApi = FakeStorageApi();

    Future<UserStateNotifier> beforeTest() async {
      SharedPreferences.setMockInitialValues({});
      final sharedPrefs = await SharedPreferences.getInstance();
      final deviceRepository = DeviceRepository(
        deviceApi: FakeDeviceApi(),
        prefs: sharedPrefs,
      );

      final userRepository = UserRepository(
        userApi: FakeUserApi(storageApi: fakeStorageApi),
      );

      final loadUserUseCase = LoadUserUseCase(
        authRepository: authRepository,
        userRepository: userRepository,
        mode: AuthenticationMode.authRequired,
      );

      return UserStateNotifier(
        authenticationRepository: authRepository,
        userRepository: userRepository,
        deviceRepository: deviceRepository,
        loadUserUseCase: loadUserUseCase,
        mode: AuthenticationMode.authRequired,
      );
    }

    test(
      'Should load user at startup, user is not connected => user should be in unauth state',
      () async {
        final userStateNotifier = await beforeTest();
        expect(
          userStateNotifier.state.user,
          isA<LoadingUserData>(),
          reason: 'user should be in loading state at the beginning',
        );
        await userStateNotifier.init();
        expect(
          userStateNotifier.state.user,
          isA<AnonymousUserData>(),
          reason: 'user should be in unauthenticated state',
        );
      },
    );

    test(
      'Should load user at startup, user signin => state user is connected',
      () async {
        final userStateNotifier = await beforeTest();
        await userStateNotifier.init();

        await authRepository.signup('email', 'password');
        await userStateNotifier.onSignin();
        expect(
          userStateNotifier.state.user,
          isA<AuthenticatedUserData>(),
          reason: 'user should be authenticated',
        );
      },
    );

    test('on logout -> user state is anonymous', () async {
      final userStateNotifier = await beforeTest();
      await userStateNotifier.init();
      await authRepository.signup('email', 'password');
      await userStateNotifier.onSignin();
      await authRepository.logout();
      await userStateNotifier.onLogout();

      expect(
        userStateNotifier.state.user,
        isA<AnonymousUserData>(),
        reason: 'user should be anonymous',
      );
    });
  });

  group('authRequired anonymous', () {
    final authRepository = AuthenticationRepository(
      logger: Logger(),
      authenticationApi: FakeAuthenticationApi(),
      storage: FakeAuthSecuredStorage.empty(),
      userApi: FakeUserApi(storageApi: FakeStorageApi()),
      httpClient: HttpClient(baseUrl: ''),
    );

    final fakeStorageApi = FakeStorageApi();

    Future<UserStateNotifier> beforeTest() async {
      SharedPreferences.setMockInitialValues({});
      final sharedPrefs = await SharedPreferences.getInstance();
      final deviceRepository = DeviceRepository(
        deviceApi: FakeDeviceApi(),
        prefs: sharedPrefs,
      );

      final userRepository = UserRepository(
        userApi: FakeUserApi(storageApi: fakeStorageApi),
      );

      final loadUserUseCase = LoadUserUseCase(
        authRepository: authRepository,
        userRepository: userRepository,
        mode: AuthenticationMode.anonymous,
      );

      return UserStateNotifier(
        authenticationRepository: authRepository,
        userRepository: userRepository,
        deviceRepository: deviceRepository,
        loadUserUseCase: loadUserUseCase,
        // ignore: avoid_redundant_argument_values
        mode: AuthenticationMode.anonymous,
      );
    }

    test(
      'Should load user at startup, user is not connected => login user anonymously with id',
      () async {
        final userStateNotifier = await beforeTest();
        expect(
          userStateNotifier.state.user,
          isA<LoadingUserData>(),
          reason: 'user should be in loading state at the beginning',
        );
        await userStateNotifier.init();
        expect(
          userStateNotifier.state.user,
          isA<AnonymousUserData>(),
          reason: 'user should be in unauthenticated state',
        );
        expect(
          userStateNotifier.state.user.idOrThrow,
          'fake-user-id-anonymous',
        );
      },
    );

    test(
      'Should load user at startup, user signin => state user is connected',
      () async {
        final userStateNotifier = await beforeTest();
        await userStateNotifier.init();

        await authRepository.signup('email', 'password');
        await userStateNotifier.onSignin();
        expect(
          userStateNotifier.state.user,
          isA<AuthenticatedUserData>(),
          reason: 'user should be authenticated',
        );
      },
    );

    test('on logout -> user state is anonymous with id', () async {
      final userStateNotifier = await beforeTest();
      await userStateNotifier.init();
      await authRepository.signup('email', 'password');
      await userStateNotifier.onSignin();
      await authRepository.logout();
      await userStateNotifier.onLogout();

      expect(
        userStateNotifier.state.user,
        isA<AnonymousUserData>(),
        reason: 'user should be anonymous',
      );
      expect(userStateNotifier.state.user.idOrThrow, 'fake-user-id-anonymous');
    });
  });
}
