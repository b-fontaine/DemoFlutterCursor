import 'package:demo_flutter_cursor/core/data/api/dto/user/user_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'user.freezed.dart';

@freezed
sealed class User with _$User {
  const factory User.authenticated({
    required String email,
    String? name,
    String? id,
    DateTime? creationDate,
    DateTime? lastUpdateDate,
    String? avatarPath,
    required bool onboarded,
  }) = AuthenticatedUserData;

  const factory User.anonymous({
    String? id,
    bool? onboarded,
    DateTime? creationDate,
    DateTime? lastUpdateDate,
  }) = AnonymousUserData;

  const factory User.loading() = LoadingUserData;

  const User._();

  factory User.fromDTO(UserDTO? entity) {
    try {
      if (entity == null) {
        return const User.anonymous();
      }
      if (entity.email == null) {
        return User.anonymous(
          id: entity.id,
          onboarded: entity.onboarded ?? false,
          creationDate: entity.creationDate,
          lastUpdateDate: entity.lastUpdateDate,
        );
      }
      return User.authenticated(
        id: entity.id,
        email: entity.email!,
        name: entity.name,
        onboarded: entity.onboarded ?? false,
        avatarPath: entity.avatarPath,
        creationDate: entity.creationDate,
        lastUpdateDate: entity.lastUpdateDate,
      );
    } catch (e, trace) {
      Logger().e(e, stackTrace: trace);
      rethrow;
    }
  }

  UserDTO toDTO() {
    return switch (this) {
      final AuthenticatedUserData value => UserDTO(
        id: value.id,
        email: value.email,
        name: value.name ?? '',
        onboarded: value.onboarded,
        avatarPath: value.avatarPath,
        creationDate: value.creationDate,
        lastUpdateDate: value.lastUpdateDate,
      ),
      final AnonymousUserData value => UserDTO(
        id: value.id,
        name: '',
        onboarded: value.onboarded,
        creationDate: value.creationDate,
        lastUpdateDate: value.lastUpdateDate,
      ),
      LoadingUserData() => throw "user is not connected",
    };
  }

  String get idOrThrow => switch (this) {
    AuthenticatedUserData(:final id) => id!,
    AnonymousUserData(:final id) => id!,
    LoadingUserData() => throw "user is not connected",
  };

  String? get idOrNull => switch (this) {
    AuthenticatedUserData(:final id) => id,
    AnonymousUserData(:final id) => id,
    LoadingUserData() => null,
  };

  bool get isLoading => switch (this) {
    AuthenticatedUserData() => false,
    AnonymousUserData() => false,
    LoadingUserData() => true,
  };

  bool get isOnboarded => switch (this) {
    AuthenticatedUserData(:final onboarded) => onboarded,
    AnonymousUserData(:final onboarded) => onboarded ?? false,
    LoadingUserData() => false,
  };
}
