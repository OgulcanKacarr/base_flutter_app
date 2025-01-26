import 'package:base_app/viewModel/auth/CreatePageViewModel.dart';
import 'package:base_app/viewModel/auth/LoginPageViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  Widget _buildBody(){
    return Column(
      children: [

      ],
    );
  }
}
