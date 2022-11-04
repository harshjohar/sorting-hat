import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sorting_hat/screens/welcome/welcome_screen.dart';

void main() {
  runApp(const SortingHat());
}

class SortingHat extends StatelessWidget {
  const SortingHat({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sorting Hat',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
    );
  }
}
