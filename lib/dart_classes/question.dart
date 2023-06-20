class Question {
  final String question;
  final String answer;
  final String imageURL;
  final String category;
  final List<Hint> hints;

  Question(
      {required this.question,
      required this.answer,
      required this.hints,
      required this.imageURL,
      required this.category});

  (String, String, String, String, List<Hint>) getQuestionInfo() {
    return (question, answer, imageURL, category, hints);
  }
}

class Hint {
  final String text;
  bool visible = false;

  Hint({required this.text});

  toggleHint() {
    visible = !visible;
  }
}
