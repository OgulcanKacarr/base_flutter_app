import 'package:base_app/constants/AppAssets.dart';
import 'package:base_app/constants/AppPagePath.dart';
import 'package:base_app/constants/AppSizes.dart';
import 'package:base_app/constants/AppStrings.dart';
import 'package:base_app/viewModel/auth/LoginPageViewModel.dart';
import 'package:base_app/widgets/CustomButton.dart';
import 'package:base_app/widgets/CustomCard.dart';
import 'package:base_app/widgets/CustomIndicator.dart';
import 'package:base_app/widgets/CustomText.dart';
import 'package:base_app/widgets/CustomTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final provider = ChangeNotifierProvider((ref) => LoginPageViewModel());

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    var watch = ref.watch(provider);
    var read = ref.read(provider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage(AppAssets.logo.pathString),
          ),
        ),
        CustomCard(
            child: Column(
          children: [
            CustomTextField(
                controller: _emailController,
                hintText: AppStrings.email,
                prefixIcon: const Icon(Icons.alternate_email),
                keyboardType: TextInputType.emailAddress),
            const SizedBox(
              height: AppSizes.paddingSmall,
            ),
            CustomTextField(
                controller: _passwordController,
                hintText: AppStrings.password,
                prefixIcon: const Icon(Icons.lock),
                isPassword: true,
                keyboardType: TextInputType.text),
            const SizedBox(
              height: AppSizes.paddingSmall,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Checkbox(
                    activeColor: Colors.greenAccent,
                    checkColor: Colors.black,
                    value: watch.getRememberMe,
                    onChanged: (value) {
                      read.setRememberMe(value!);
                    },
                  ),
                  const CustomText(text: AppStrings.rememberMe),
                ],
              ),
            ),
            CustomButton(text: AppStrings.login, onPressed: () async {
              read.login(context, _emailController.text,_passwordController.text);
            }),
            const SizedBox(
              height: AppSizes.paddingSmall,
            ),
            const CustomText(text: AppStrings.or),
            const SizedBox(
              height: AppSizes.paddingSmall,
            ),
            const CustomIndicator(),
            const SizedBox(
              height: AppSizes.paddingSmall,
            ),
            TextButton(
                onPressed: () async {}, child: const Text(AppStrings.register)),
          ],
        )),
      ],
    );
  }
}
