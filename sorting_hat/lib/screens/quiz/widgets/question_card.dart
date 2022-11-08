import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:sorting_hat/constants.dart';
import 'package:sorting_hat/controllers/quiz_controller.dart';
import 'package:sorting_hat/models/question.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    Key? key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  double value = 0;
  final emojis = ['🥲', '😥', '🙃', '😐', '🙂', '😃', '🤩'];
  final reaction = [
    'Strongly Disagree',
    'Disagree',
    'Somewhat Disagree',
    'Neutral',
    'Somewhat Agree',
    'Agree',
    'Strongly Agree'
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    QuestionController controller = Get.put(QuestionController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            widget.question.question,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: kBlackColor),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          Container(
            height: size.height * 0.35,
            alignment: Alignment.center,
            child: Text(
              emojis[value.ceil() + 3],
              style: const TextStyle(fontSize: 80),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            reaction[value.ceil() + 3],
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
          SfSlider(
              min: -3.0,
              max: 3.0,
              value: value,
              interval: 1,
              showTicks: true,
              stepSize: 1,
              activeColor: Colors.red,
              minorTicksPerInterval: 1,
              onChanged: (dynamic v) {
                setState(() {
                  value = v;
                });
              }),
          CupertinoButton.filled(
              child: const Text("NEXT"),
              onPressed: () {
                controller.saveAns(widget.question, value.ceil());
              }),
        ],
      ),
    );
  }
}
