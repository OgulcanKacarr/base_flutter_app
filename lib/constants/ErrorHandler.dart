import 'package:firebase_auth/firebase_auth.dart'; // FirebaseAuthException için
import 'package:flutter/cupertino.dart';
import 'AppStrings.dart';
import 'ConstMethods.dart';

class ErrorHandler {
  // Firebase ve genel hataları işleme
  static String handleError(BuildContext context,Object error) {
    String errorMessage = '';

    // Firebase hatası ise
    if (error is FirebaseAuthException) {
      errorMessage = _handleFirebaseError(error.code);
    }
    // Diğer genel hatalar
    else if (error is Exception) {
      errorMessage = _handleGeneralError(error);
    } else {
      errorMessage = AppStrings.error;  // Tanımlı olmayan hatalar için genel mesaj
    }

    // Hatayı console'a yazdırma
    print("Hata: $errorMessage");

    // Hatayı kullanıcıya göstermek için ConstMethods kullan
    ConstMethods.showSnackBar(context,errorMessage);

    return errorMessage;
  }

  // Firebase hatası için yönetim
  static String _handleFirebaseError(String errorCode) {
    Map<String, String> authErrors = {
      "email-already-in-use": "Bu e-posta adresi zaten başka bir hesap tarafından kullanılıyor.",
      "invalid-email": "E-posta adresi hatalı biçimlendirilmiş.",
      "wrong-password": "Şifre geçersiz veya kullanıcı bir şifreye sahip değil.",
      "user-not-found": "Bu e-posta adresine sahip bir kullanıcı bulunamadı.",
      "account-exists-with-different-credential": "Aynı e-posta adresine sahip bir hesap farklı kimlik bilgileriyle mevcut. Bu e-posta adresiyle ilişkili bir sağlayıcıyı kullanarak oturum açın.",
      "credential-already-in-use": "Bu kimlik bilgisi zaten başka bir kullanıcı hesabıyla ilişkilendirilmiş.",
      "operation-not-allowed": "Belirtilen oturum açma sağlayıcısı bu Firebase projesinde devre dışı bırakılmış. Firebase konsolundan etkinleştirin.",
      "requires-recent-login": "Bu işlem hassas olduğundan, son bir kimlik doğrulaması gerektirir. Bu isteği tekrar denemeden önce tekrar giriş yapın.",
      "user-disabled": "Bu kullanıcı hesabı devre dışı bırakılmış.",
      "invalid-credential": "Sağlanan kimlik bilgisi bozuk veya süresi dolmuş.",
      "missing-email": "E-posta adresi sağlanmamış.",
      "missing-password": "Şifre sağlanmamış.",
      "invalid-action-code": "İşlem kodu geçersiz. Bu, kod bozuk, süresi dolmuş veya daha önce kullanılmış olabilir.",
      "expired-action-code": "İşlem kodunun süresi doldu.",
      "weak-password": "Şifre yanlış.",
      "email-change-needs-verification": "Çok faktörlü kullanıcıların her zaman doğrulanmış bir e-posta adresine sahip olması gerekir.",
    };

    // Firebase hatalarını dön
    return authErrors[errorCode] ?? AppStrings.error;
  }

  // Diğer genel hatalar için yönetim
  static String _handleGeneralError(Exception error) {
    // Burada daha fazla hata türü kontrolü ekleyebilirsiniz
    if (error.toString().contains('NetworkError')) {
      return 'Ağ hatası, lütfen bağlantınızı kontrol edin.';
    } else if (error.toString().contains('TimeoutException')) {
      return 'Sunucuya bağlanılamadı. Lütfen tekrar deneyin.';
    } else {
      return AppStrings.error; // Diğer hatalar için genel mesaj
    }
  }
}
