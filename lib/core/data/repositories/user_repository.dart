import 'package:demo_flutter_cursor/core/data/api/dto/upload_result.dart';
import 'package:demo_flutter_cursor/core/data/api/image.dart';
import 'package:demo_flutter_cursor/core/data/api/user_api.dart';
import 'package:demo_flutter_cursor/core/domain/models/user/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepository(userApi: ref.read(userApiProvider)),
);

class UserRepository {
  final UserApi _userApi;

  UserRepository({required UserApi userApi}) : _userApi = userApi;

  Future<User?> get(String id) async {
    final userDto = await _userApi.get(id);
    if (userDto == null) {
      return null;
    }
    return User.fromDTO(userDto);
  }

  Future<void> create(User user) async {
    await _userApi.create(user.toDTO());
  }

  /// We updates the user avatar
  /// We convert the image to jpeg and resize it to 300px width
  /// and 80% quality to reduce the size of the image
  /// Most of the current phones makes pictures with a width of 3000px.
  /// That can take a lot of time and bandwidth to upload.
  /// We then upload the image
  Stream<UploadResult> saveAvatar({
    required String userId,
    required Uint8List data,
  }) async* {
    final jpgData = await compute(
      imgToJpeg,
      JpegParams(data: data, maxWidth: 450, quality: 80),
    );
    yield* _userApi.updateAvatar(userId, jpgData);
  }

  Future<User> setOnboarded(User user) async {
    final userCpy = switch (user) {
      final AuthenticatedUserData value => value.copyWith(onboarded: true),
      final AnonymousUserData value => value.copyWith(onboarded: true),
      _ => throw Exception('User not found'),
    };

    await _userApi.update(userCpy.toDTO());
    return userCpy;
  }

  /// Apple store and Google play stores requires you to be able to delete a user account on demand
  /// Here is the function to do it.
  Future<void> delete() async {
    await _userApi.deleteMe();
  }
}
