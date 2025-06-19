import 'package:demo_flutter_cursor/core/data/api/http_client.dart';
import 'package:demo_flutter_cursor/core/data/repositories/authentication_repository.dart';
import 'package:demo_flutter_cursor/core/data/repositories/device_repository.dart';
import 'package:demo_flutter_cursor/core/data/repositories/user_repository.dart';
import 'package:demo_flutter_cursor/core/domain/models/auth/authentication_mode.dart';
import 'package:demo_flutter_cursor/core/domain/models/user/user.dart';
import 'package:demo_flutter_cursor/core/domain/usecases/delete_account_use_case.dart';
import 'package:demo_flutter_cursor/core/domain/usecases/get_user_use_case.dart';
import 'package:demo_flutter_cursor/core/domain/usecases/load_user_use_case.dart';
import 'package:demo_flutter_cursor/core/domain/usecases/logout_use_case.dart';
import 'package:demo_flutter_cursor/core/domain/usecases/register_device_use_case.dart';
import 'package:demo_flutter_cursor/core/domain/usecases/set_user_onboarded_use_case.dart';
import 'package:demo_flutter_cursor/core/ui/states/user_state_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/authentication/data/api/auth_api_fake.dart';
import '../../modules/authentication/data/api/user_api_fake.dart';
import '../data/api/device_api_fake.dart';
import '../data/api/storage_api_fake.dart';
import '../data/storage/auth_secured_storage_fake.dart';
import '../data/storage/key_value_storage_fake.dart';

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
      // Given
      SharedPreferences.setMockInitialValues({});
      final fakeKeyValueStorage = KeyValueStorageFake();

      final deviceRepository = DeviceRepository(
        deviceApi: FakeDeviceApi(),
        keyValueStorage: fakeKeyValueStorage,
      );

      final userRepository = UserRepository(
        userApi: FakeUserApi(storageApi: fakeStorageApi),
      );

      final loadUserUseCase = LoadUserUseCase(
        authRepository: authRepository,
        userRepository: userRepository,
        mode: AuthenticationMode.authRequired,
      );

      final deleteAccountUseCase = DeleteAccountUseCase(
        authRepository: authRepository,
        userRepository: userRepository,
        deviceRepository: deviceRepository,
      );

      final logoutUseCase = LogoutUseCase(
        authRepository: authRepository,
        deviceRepository: deviceRepository,
      );

      final registerDeviceUseCase = RegisterDeviceUseCase(
        deviceRepository: deviceRepository,
      );

      final getUserUseCase = GetUserUseCase(userRepository: userRepository);

      final setUserOnboardedUseCase = SetUserOnboardedUseCase(
        userRepository: userRepository,
      );

      return UserStateNotifier(
        loadUserUseCase: loadUserUseCase,
        deleteAccountUseCase: deleteAccountUseCase,
        logoutUseCase: logoutUseCase,
        registerDeviceUseCase: registerDeviceUseCase,
        getUserUseCase: getUserUseCase,
        setUserOnboardedUseCase: setUserOnboardedUseCase,
        mode: AuthenticationMode.authRequired,
      );
    }

    test(
      'UserStateNotifier, init with unauthenticated user => user should be in unauth state',
      () async {
        // Given
        final userStateNotifier = await beforeTest();

        expect(
          userStateNotifier.state.user,
          isA<LoadingUserData>(),
          reason: 'user should be in loading state at the beginning',
        );

        // When
        await userStateNotifier.init();

        // Then
        expect(
          userStateNotifier.state.user,
          isA<AnonymousUserData>(),
          reason: 'user should be in unauthenticated state',
        );
      },
    );

    test(
      'UserStateNotifier, init then signin => user should be authenticated',
      () async {
        // Given
        final userStateNotifier = await beforeTest();
        await userStateNotifier.init();

        // When
        await authRepository.signup('email', 'password');
        await userStateNotifier.onSignin();

        // Then
        expect(
          userStateNotifier.state.user,
          isA<AuthenticatedUserData>(),
          reason: 'user should be authenticated',
        );
      },
    );

    test(
      'UserStateNotifier, authenticated user logout => user state is anonymous',
      () async {
        // Given
        final userStateNotifier = await beforeTest();
        await userStateNotifier.init();
        await authRepository.signup('email', 'password');
        await userStateNotifier.onSignin();

        // When
        await userStateNotifier.onLogout();

        // Then
        expect(
          userStateNotifier.state.user,
          isA<AnonymousUserData>(),
          reason: 'user should be anonymous',
        );
      },
    );
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
      // Given
      SharedPreferences.setMockInitialValues({});
      final fakeKeyValueStorage = KeyValueStorageFake();
      final deviceRepository = DeviceRepository(
        deviceApi: FakeDeviceApi(),
        keyValueStorage: fakeKeyValueStorage,
      );

      final userRepository = UserRepository(
        userApi: FakeUserApi(storageApi: fakeStorageApi),
      );

      final loadUserUseCase = LoadUserUseCase(
        authRepository: authRepository,
        userRepository: userRepository,
        mode: AuthenticationMode.anonymous,
      );

      final deleteAccountUseCase = DeleteAccountUseCase(
        authRepository: authRepository,
        userRepository: userRepository,
        deviceRepository: deviceRepository,
      );

      final logoutUseCase = LogoutUseCase(
        authRepository: authRepository,
        deviceRepository: deviceRepository,
      );

      final registerDeviceUseCase = RegisterDeviceUseCase(
        deviceRepository: deviceRepository,
      );

      final getUserUseCase = GetUserUseCase(userRepository: userRepository);

      final setUserOnboardedUseCase = SetUserOnboardedUseCase(
        userRepository: userRepository,
      );

      return UserStateNotifier(
        loadUserUseCase: loadUserUseCase,
        deleteAccountUseCase: deleteAccountUseCase,
        logoutUseCase: logoutUseCase,
        registerDeviceUseCase: registerDeviceUseCase,
        getUserUseCase: getUserUseCase,
        setUserOnboardedUseCase: setUserOnboardedUseCase,
        // ignore: avoid_redundant_argument_values
        mode: AuthenticationMode.anonymous,
      );
    }

    test(
      'UserStateNotifier anonymous mode, init with unauthenticated user => login user anonymously with id',
      () async {
        // Given
        final userStateNotifier = await beforeTest();

        expect(
          userStateNotifier.state.user,
          isA<LoadingUserData>(),
          reason: 'user should be in loading state at the beginning',
        );

        // When
        await userStateNotifier.init();

        // Then
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
      'UserStateNotifier anonymous mode, init then signin => state user is connected',
      () async {
        // Given
        final userStateNotifier = await beforeTest();
        await userStateNotifier.init();

        // When
        await authRepository.signup('email', 'password');
        await userStateNotifier.onSignin();

        // Then
        expect(
          userStateNotifier.state.user,
          isA<AuthenticatedUserData>(),
          reason: 'user should be authenticated',
        );
      },
    );

    test(
      'UserStateNotifier anonymous mode, authenticated user logout => user state is anonymous with id',
      () async {
        // Given
        final userStateNotifier = await beforeTest();
        await userStateNotifier.init();
        await authRepository.signup('email', 'password');
        await userStateNotifier.onSignin();

        // When
        await userStateNotifier.onLogout();

        // Then
        expect(
          userStateNotifier.state.user,
          isA<AnonymousUserData>(),
          reason: 'user should be anonymous',
        );
        expect(
          userStateNotifier.state.user.idOrThrow,
          'fake-user-id-anonymous',
        );
      },
    );
  });
}
