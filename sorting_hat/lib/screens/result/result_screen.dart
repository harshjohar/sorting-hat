import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sorting_hat/screens/developers/developers_screen.dart';

class ResultScreen extends StatelessWidget {
  final String house;

  const ResultScreen({Key? key, required this.house}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 50,
            right: 0,
            child: CupertinoButton(
              child: const Text("Meet the developers"),
              onPressed: () {
                Get.to(() => const DevelopersScreen());
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset('assets/Houses/$house.png')],
          )
        ],
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sorting_hat/constants.dart';
import 'package:sorting_hat/screens/developers/developers_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 50,
            right: 0,
            child: CupertinoButton(
              child: const Text("Meet the developers"),
              onPressed: () {
                Get.to(() => const DevelopersScreen());
              },
            ),
          ),
          Column(
            children: [
              const Spacer(flex: 3),
              Text(
                "House",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: kSecondaryColor),
              ),
              const Spacer(),
              Text(
                "Response...",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: kSecondaryColor),
              ),
              const Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
