import 'package:base_app/services/AbstractClassForServices/AbstractAuthService.dart';
import 'package:base_app/services/FirebaseAuthService.dart';
import 'package:flutter/cupertino.dart';

import '../../constants/AppStrings.dart';
import '../../constants/ConstMethods.dart';

class CreatePageViewModel extends ChangeNotifier {
  final AbstractAuthService _authService = FirebaseAuthService();



  Future<void> create(BuildContext context, String email, String password,
      String rePassword) async {
    if (email.isEmpty && password.isEmpty && rePassword.isEmpty) {
      ConstMethods.showSnackBar(context, AppStrings.infoNotEmpty);
    } else if (email.isEmpty) {
      ConstMethods.showSnackBar(context, AppStrings.emailNotEmpty);
    } else if (password.isEmpty) {
      ConstMethods.showSnackBar(context, AppStrings.passwordNotEmpty);
    } else if (rePassword.isEmpty) {
      ConstMethods.showSnackBar(context, AppStrings.enterRePasswordNotEmpty);
    } else if (password != rePassword) {
      ConstMethods.showSnackBar(context, AppStrings.notValidatedPassword);
    } else {
      _authService.signUp(email, password);
    }
  }
}
