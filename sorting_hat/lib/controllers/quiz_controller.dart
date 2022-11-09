import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sorting_hat/models/question.dart';
import 'package:sorting_hat/screens/loading/loading_screen.dart';
import 'package:http/http.dart' as http;
import 'package:sorting_hat/screens/result/result_screen.dart';

// rewrite this logic in riverpod
class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => _animation;

  late PageController _pageController;
  PageController get pageController => _pageController;

  final List<Question> _questions = questionData
      .map(
        (question) => Question(
          id: question['id'],
          question: question['question'],
          options: question['options'],
        ),
      )
      .toList();
  List<Question> get questions => _questions;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  int _selectedAns = 0;
  int get selectedAns => _selectedAns;

  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  final List<int> _answers = List.filled(15, 0);
  List<int> get answers => _answers;

  @override
  void onInit() {
    _animationController = AnimationController(
        duration: const Duration(seconds: 120), vsync: this);
    _animation = Tween<double>(begin: 1, end: 0).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
      _animationController.reset();

      _animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.offAll(() => const LoadingScreen());
    }
  }

  Future<String> apiCall() async {
    final response = await http
        .post(Uri.parse("https://sorting-hat-pec.herokuapp.com/api"), body: {
      "exp": [_answers]
    });
    final house = convert.jsonDecode(response.body) as String;
    return house;
  }

  Future<void> addToFirebase() async {
    // TODO
  }

  void saveAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _selectedAns = selectedIndex;

    _answers[_questionNumber.value - 1] = _selectedAns;
    debugPrint(_answers.toString());
    _animationController.stop();
    update();
    nextQuestion();
    debugPrint(_answers.toString());
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
