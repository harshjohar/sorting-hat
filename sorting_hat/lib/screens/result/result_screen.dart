import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:sorting_hat/controllers/auth_controller.dart';
import 'package:sorting_hat/screens/developers/developers_screen.dart';
import 'package:sorting_hat/screens/loading/loading_screen.dart';
import 'package:sorting_hat/constants.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({Key? key}) : super(key: key);
  String getHouseName(String? house) {
    switch (house) {
      case 'G':
        return "Gryffindor";
      case 'R':
        return "Ravenclaw";
      case 'S':
        return "Slytherin";
      case 'H':
        return "Hufflepuff";
      default:
        return "Hogwarts";
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FutureBuilder(
        future: ref.read(authControllerProvider).getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          }
          final user = snapshot.data;
          return Stack(
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
                children: [
                  if (user != null)
                    Text(
                        "Congrats ${user.name}, you are a proud ${getHouseName(user.house!)}."),
                  Image.asset('assets/Houses/${user?.house}.png'),
                  Text("Some of traits of ${getHouseName(user?.house)} TODO"),
                  Traits(house: user?.house),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}

class Traits extends StatelessWidget {
  const Traits({this.house, super.key});
  final String? house;
  @override
  Widget build(BuildContext context) {
    return Container(
        // use houseList[house], it will return a list and show it in your way
        );
  }
}
