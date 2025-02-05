import 'package:base_app/constants/AppStrings.dart';
import 'package:base_app/constants/ConstMethods.dart';
import 'package:base_app/services/AbstractClassForServices/AbstractAuthService.dart';
import 'package:base_app/services/FirebaseAuthService.dart';
import 'package:flutter/cupertino.dart';

class LoginPageViewModel extends ChangeNotifier {
  final AbstractAuthService _authService = FirebaseAuthService();

  bool _isRememberMe = false;

  get getRememberMe => _isRememberMe;

  void setRememberMe(bool value) {
    _isRememberMe = value;
    notifyListeners();
  }

  Future<void> login(
      BuildContext context, String email, String password) async {
    if (email.isEmpty && password.isEmpty) {
      ConstMethods.showSnackBar(context, AppStrings.infoNotEmpty);
    } else if (email.isEmpty) {
      ConstMethods.showSnackBar(context, AppStrings.emailNotEmpty);
    } else if (password.isEmpty) {
      ConstMethods.showSnackBar(context, AppStrings.passwordNotEmpty);
    } else {
      _authService.signIn(email, password);
    }
  }
}
