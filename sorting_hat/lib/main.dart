import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:sorting_hat/controllers/auth_controller.dart';
import 'package:sorting_hat/firebase_options.dart';
import 'package:sorting_hat/router.dart';
import 'package:sorting_hat/screens/quiz/quiz_screen.dart';
import 'package:sorting_hat/screens/result/result_screen.dart';
import 'package:sorting_hat/screens/welcome/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: SortingHat()));
}

class SortingHat extends ConsumerWidget {
  const SortingHat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GetMaterialApp(
      title: 'Sorting Hat',
      theme: ThemeData.dark().copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 3,
              color: Colors.greenAccent,
              style: BorderStyle.none,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.amberAccent),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: ref.watch(userProvider).when(data: (user) {
        if (user == null) {
          return const WelcomeScreen();
        }
        if (user.house!.isNotEmpty) {
          return ResultScreen(
            house: user.house!,
          );
        }
        return const QuizScreen();
      }, error: (error, trace) {
        return Scaffold(
          body: Center(
            child: Text(error.toString()),
          ),
        );
      }, loading: () {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
