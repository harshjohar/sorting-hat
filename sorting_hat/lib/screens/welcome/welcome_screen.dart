import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif/gif.dart';
import 'package:sorting_hat/constants.dart';
import 'package:sorting_hat/screens/auth/login_screen.dart';
import 'package:sorting_hat/widgets/custom_text_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var button = CustomTextButton(
        text: "Let's go",
        fn: () {
          Get.toNamed(LoginScreen.routeName);
        });
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: kGreenColor,
            height: double.infinity,
            width: double.infinity,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Gif(
                      placeholder: (context) {
                        return const SizedBox(
                          height: 390,
                          width: 380,
                        );
                      },
                      autostart: Autostart.once,
                      image: const AssetImage(
                        'assets/welcome.gif',
                      ),
                    ),
                  ),
                  button
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
