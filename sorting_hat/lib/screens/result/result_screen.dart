import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:sorting_hat/controllers/auth_controller.dart';
import 'package:sorting_hat/screens/developers/developers_screen.dart';
import 'package:sorting_hat/screens/loading/loading_screen.dart';
import 'package:sorting_hat/constants.dart';
import 'package:url_launcher/url_launcher.dart';

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
    final size = MediaQuery.of(context).size;
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
              Image.asset(
                'assets/Houses/${user?.house}.jpg',
                height: size.height,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 50,
                right: 0,
                child: IconButton(
                  icon: const Icon(Icons.developer_mode),
                  onPressed: () {
                    Get.to(() => const DevelopersScreen());
                  },
                ),
              ),
              if (user != null)
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icon/trans_icon.png',
                        height: 100,
                        width: 100,
                      ),
                      const Spacer(flex: 6),
                      Text(
                        user.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ...(houseData[user.house!]!
                              .map((trait) => Text(trait))
                              .toList()),
                        ],
                      ),
                      const Spacer(),
                      OutlinedButton(
                        onPressed: () {
                          launchUrl(Uri.parse("https://www.wizardingworld.com/features/hogwarts-house-meanings"));
                        },
                        child: const Text(
                          "View your house",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     if (user != null)
              //       Text(
              //           "Congrats ${user.name}, you are a proud ${getHouseName(user.house!)}."),
              //   ],
              // )
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
