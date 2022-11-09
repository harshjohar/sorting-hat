import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorting_hat/constants.dart';
import 'package:sorting_hat/controllers/auth_controller.dart';
import 'package:sorting_hat/widgets/custom_text_button.dart';

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
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: kGreenColor,
            height: double.infinity,
            width: double.infinity,
          ),
          SafeArea(
              child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "User Information",
                  style: theme.textTheme.headline4,
                ),
                const SizedBox(height: 16),
                Text(
                  "Please enter your name",
                  style: theme.textTheme.headline6,
                ),
                Container(
                  width: size.width * 0.85,
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    cursorColor: kYellowColor,
                    autofocus: true,
                    controller: _nameController,
                    decoration: const InputDecoration(hintText: "Full Name"),
                    onSubmitted: ((_) => saveUserData()),
                  ),
                ),
                const Spacer(),
                CustomTextButton(text: "Submit", fn: saveUserData),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
