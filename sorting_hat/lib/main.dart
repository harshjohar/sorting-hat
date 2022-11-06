import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:sorting_hat/firebase_options.dart';
import 'package:sorting_hat/router.dart';
import 'package:sorting_hat/screens/welcome/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: SortingHat()));
}

class SortingHat extends StatelessWidget {
  const SortingHat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sorting Hat',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
