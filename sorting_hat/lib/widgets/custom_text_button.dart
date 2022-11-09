import 'package:flutter/material.dart';
import 'package:sorting_hat/constants.dart';
import 'package:sorting_hat/widgets/touchable_opacity.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.text, required this.fn});
  final String text;
  final VoidCallback fn;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
        onTap: () {
          fn();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kYellowColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              color: kGreenColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
