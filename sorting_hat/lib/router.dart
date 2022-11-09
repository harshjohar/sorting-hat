import 'package:flutter/material.dart';
import 'package:sorting_hat/screens/auth/login_screen.dart';
import 'package:sorting_hat/screens/auth/otp_screen.dart';
import 'package:sorting_hat/screens/auth/user_info_screen.dart';
import 'package:sorting_hat/screens/common/error_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (ctx) {
        return const LoginScreen();
      });
    case OTPScreen.routeName:
      return MaterialPageRoute(builder: (ctx) {
        String verificationId = settings.arguments as String;
        return OTPScreen(
          verificationId: verificationId,
        );
      });
    case UserInformationScreen.routeName:
      return MaterialPageRoute(builder: (ctx) {
        return const UserInformationScreen();
      });
    default:
      return MaterialPageRoute(builder: (ctx) {
        return const ErrorScreen(error: "This page doesn't exist");
      });
  }
}
