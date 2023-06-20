class Question {
  final String question;
  final String answer;
  final String imageURL;
  final String category;
  final List<String> hints;

  Question(
      {required this.question,
      required this.answer,
      required this.hints,
      required this.imageURL,
      required this.category});

  (String, String, String, String, List<String>) getQuestionInfo() {
    return (question, answer, imageURL, category, hints);
  }
}
