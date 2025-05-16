import 'dart:typed_data';

import 'package:demo_flutter_cursor/core/data/api/dto/upload_result.dart';
import 'package:demo_flutter_cursor/core/data/api/dto/user/user_dto.dart';
import 'package:demo_flutter_cursor/core/data/api/storage_api.dart';
import 'package:demo_flutter_cursor/core/data/api/user_api.dart';

class FakeUserApi implements UserApi {
  final StorageApi storageApi;
  UserDTO? getUserResult;

  FakeUserApi({required this.storageApi});

  @override
  Future<UserDTO> get(String id) async {
    if (id == 'fake-user-id-anonymous') {
      return UserDTO(
        id: id,
        creationDate: DateTime.now(),
        lastUpdateDate: DateTime.now(),
      );
    }
    return getUserResult ??
        UserDTO(
          id: 'userid',
          name: 'Mac Gyver',
          email: 'mac@gyver.com',
          avatarPath: 'https://avatar.com/macgyver.png',
          creationDate: DateTime.now(),
          lastUpdateDate: DateTime.now(),
        );
  }

  @override
  Future<void> create(UserDTO user) async {
    getUserResult = user;
  }

  @override
  Future<void> delete(String id) {
    return Future.value();
  }

  @override
  Future<void> deleteMe() {
    return Future.value();
  }

  @override
  Future<void> update(UserDTO user) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Stream<UploadResult> updateAvatar(String userId, Uint8List data) async* {
    final task = storageApi.uploadData(
      data,
      'users/$userId/avatar',
      'thumb.jpg',
      mimeType: 'image/jpg',
    );

    late UploadResult lastRes;
    await for (final res in task) {
      yield res;
      lastRes = res;
    }
    if (lastRes case UploadResultCompleted()) {
      return;
    } else {
      throw Exception('Upload failed');
    }
  }
}
