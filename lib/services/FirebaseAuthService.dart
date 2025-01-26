import 'package:base_app/constants/ErrorHandler.dart';
import 'package:base_app/services/AbstractClassForServices/AbstractAuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService implements AbstractAuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  ///Aktif kullanıcı id'yi al
  @override
  Future<String?> getCurrentUserId() async {
    return _firebaseAuth.currentUser?.uid;
  }

  ///kullanıcı daha önce  giriş yapmış mı
  @override
  Future<bool> isAuthenticated() async {
    return _firebaseAuth.currentUser != null;
  }

  //Email ve şifre ile giriş yap
  @override
  Future<String?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user?.uid;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  ///Çıkış yap
  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  ///Kullanıcı oluştur
  @override
  Future<String?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user?.uid;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }
  
}