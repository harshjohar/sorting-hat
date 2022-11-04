class Question {
  final int id;
  final String question;
  final List<String> options;

  Question({required this.id, required this.question, required this.options});
}

const List questionData = [
  {
    "id": 1,
    "question": "Demo Question",
    "options": ['Opt1', 'Opt2', 'Opt3', 'Opt4'],
    "answer_index": 1,
  },
];
