import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorting_hat/controllers/auth_controller.dart';

class UserInformationScreen extends ConsumerStatefulWidget {
  const UserInformationScreen({Key? key}) : super(key: key);
  static const String routeName = '/user-info-screen';

  @override
  ConsumerState<UserInformationScreen> createState() =>
      _UserInformationScreenState();
}

class _UserInformationScreenState extends ConsumerState<UserInformationScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void saveUserData() async {
    String name = _nameController.text.trim();

    if (name.isNotEmpty) {
      ref.read(authControllerProvider).saveDataToFirebase(
            name: name,
            context: context,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              Container(
                width: size.width * 0.85,
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: _nameController,
                  decoration:
                      const InputDecoration(hintText: "Enter your name Bitch!"),
                ),
              ),
              IconButton(
                onPressed: () {
                  saveUserData();
                },
                icon: const Icon(Icons.done),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
