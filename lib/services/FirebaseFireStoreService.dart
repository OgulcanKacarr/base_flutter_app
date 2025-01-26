import 'package:base_app/services/AbstractClassForServices/AbstractFirebaseFireStoreService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFireStoreService implements AbstractFirebaseFireStoreService {
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;

  @override
  Future<void> addDocument(String collection, Map<String, dynamic> data) async {
    try {
      await _firebaseFireStore.collection(collection).add(data);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>?> getDocument(String collection, String docId) async {
    try {
      DocumentSnapshot doc = await _firebaseFireStore.collection(collection).doc(docId).get();
      return doc.data() as Map<String, dynamic>?;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<void> updateDocument(String collection, String docId, Map<String, dynamic> data) async {
    try {
      await _firebaseFireStore.collection(collection).doc(docId).update(data);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<void> deleteDocument(String collection, String docId) async {
    try {
      await _firebaseFireStore.collection(collection).doc(docId).delete();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getAllDocuments(String collection) async {
    try {
      QuerySnapshot querySnapshot = await _firebaseFireStore.collection(collection).get();
      return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
