import 'dart:typed_data';

import 'package:demo_flutter_cursor/core/data/api/storage_api.dart';
import 'package:demo_flutter_cursor/core/data/api/dto/upload_result.dart';

class FakeStorageApi implements StorageApi {
  @override
  Future<void> deleteFile(String? imagePath) async {
    await Future.delayed(const Duration(milliseconds: 50));
  }

  @override
  Stream<UploadResult> uploadData(
    Uint8List data,
    String folder,
    String filename, {
    String? mimeType,
    bool isPublic = true,
  }) async* {
    for (var i = 0; i < 10; i++) {
      yield UploadResultProgress(i / 10);
    }
    yield UploadResultCompleted(
      imagePath: 'imagePath',
      imagePublicUrl: 'imagePublicUrl',
    );
  }
}
