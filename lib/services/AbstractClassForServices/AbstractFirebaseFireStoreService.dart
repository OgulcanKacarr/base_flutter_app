abstract class AbstractFirebaseFireStoreService {
  Future<void> addDocument(String collection, Map<String, dynamic> data);
  Future<Map<String, dynamic>?> getDocument(String collection, String docId);
  Future<void> updateDocument(String collection, String docId, Map<String, dynamic> data);
  Future<void> deleteDocument(String collection, String docId);
  Future<List<Map<String, dynamic>>> getAllDocuments(String collection);
}
