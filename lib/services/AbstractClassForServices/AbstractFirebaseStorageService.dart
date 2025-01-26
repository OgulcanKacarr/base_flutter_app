import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';

abstract class AbstractFirebaseStorageService {
  Future<String?> uploadFile(String path, String fileName, Uint8List data);
  Future<Uint8List?> downloadFile(String path);
  Future<void> deleteFile(String path);
}
