import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';
import 'package:base_app/services/AbstractClassForServices/AbstractFirebaseStorageService.dart';
import 'package:firebase_storage/firebase_storage.dart';


class FirebaseStorageService implements AbstractFirebaseStorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  @override
  Future<String?> uploadFile(String path, String fileName, Uint8List data) async {
    try {

    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<Uint8List?> downloadFile(String path) async {
    try {

    } catch (e) {

    }
  }

  @override
  Future<void> deleteFile(String path) async {
    try {

    } catch (e) {

    }
  }
}
