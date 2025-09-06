class ResultModel {
  String? type;
  String? difficulty;
  String? category;
  String? question;
  String? correctAnswer;
  List<String>? incorrectAnswers;
  List<String>? allAnswers;

  ResultModel({
    this.type,
    this.difficulty,
    this.category,
    this.question,
    this.correctAnswer,
    this.incorrectAnswers,
    this.allAnswers,
  });

  ResultModel.fromJson(Map<String, dynamic> jsonData) {
    type = jsonData['type'];
    difficulty = jsonData['difficulty'];
    category = jsonData['category'];
    question = jsonData['question'];
    correctAnswer = jsonData['correct_answer'];
    incorrectAnswers = jsonData['incorrect_answers'].cast<String>();
    allAnswers = List<String>.from(incorrectAnswers!);
    allAnswers!.add(correctAnswer!);
    allAnswers!.shuffle();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['difficulty'] = difficulty;
    data['category'] = category;
    data['question'] = question;
    data['correct_answer'] = correctAnswer;
    data['incorrect_answers'] = incorrectAnswers;
    return data;
  }
}
