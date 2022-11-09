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
