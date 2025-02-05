import 'package:base_app/viewModel/auth/CreatePageViewModel.dart';
import 'package:base_app/viewModel/auth/LoginPageViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/AppAssets.dart';
import '../../constants/AppPagePath.dart';
import '../../constants/AppSizes.dart';
import '../../constants/AppStrings.dart';
import '../../widgets/CustomButton.dart';
import '../../widgets/CustomCard.dart';
import '../../widgets/CustomIndicator.dart';
import '../../widgets/CustomText.dart';
import '../../widgets/CustomTextField.dart';

final provider = ChangeNotifierProvider((ref) => CreatePageViewModel());
class CreatePage extends ConsumerStatefulWidget {
  const CreatePage({super.key});

  @override
  ConsumerState<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends ConsumerState<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }
  Widget _buildBody() {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _rePasswordController = TextEditingController();
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
                CustomTextField(
                    controller: _rePasswordController,
                    hintText: AppStrings.rePassword,
                    prefixIcon: const Icon(Icons.lock),
                    isPassword: true,
                    keyboardType: TextInputType.text),
                const SizedBox(
                  height: AppSizes.paddingSmall,
                ),

                CustomButton(text: AppStrings.register, onPressed: () async {

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
                    onPressed: () async {
                      Navigator.pushReplacementNamed(context, AppPagePath.loginPage.pathString);
                    }, child: const Text(AppStrings.login)),
              ],
            )),
      ],
    );
  }
}
