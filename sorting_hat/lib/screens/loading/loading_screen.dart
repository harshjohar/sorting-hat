import 'package:flutter/material.dart';
import 'package:sorting_hat/constants.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kGreenColor,
      body: Center(
        child: Image.asset(
          'assets/Loading.gif',
          height: size.height,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
