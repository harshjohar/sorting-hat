import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif/gif.dart';
import 'package:sorting_hat/constants.dart';
import 'package:sorting_hat/screens/auth/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var button = TouchableOpacity(
        onTap: () {
          Get.toNamed(LoginScreen.routeName);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kYellowColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          child: const Text(
            "Let's Go",
            style: TextStyle(fontSize: 20),
          ),
        ));
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

class TouchableOpacity extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final Duration duration = const Duration(milliseconds: 50);
  final double opacity = 0.8;

  const TouchableOpacity({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  State<TouchableOpacity> createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity> {
  late bool isDown;

  @override
  void initState() {
    super.initState();
    setState(() => isDown = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isDown = true),
      onTapUp: (_) => setState(() => isDown = false),
      onTapCancel: () => setState(() => isDown = false),
      onTap: widget.onTap,
      child: AnimatedOpacity(
        duration: widget.duration,
        opacity: isDown ? widget.opacity : 1,
        child: widget.child,
      ),
    );
  }
}
