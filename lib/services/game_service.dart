import 'package:assignment_16/dart_classes/question.dart';
import 'package:flutter/material.dart';

class GameService extends ChangeNotifier {
  bool isDarkModeOn = false;
  List<Question> questions = [];

  GameService() {
    questions.add(
      Question(
          question: 'What car is this?',
          answer: 'Atlanta',
          hints: [
            Hint(text: 'It sounds similar to Atlantis.'),
            Hint(text: 'It starts and ends with an A.'),
          ],
          imageURL: 'assets/images/Atlanta_Front.webp',
          category: 'cars'),
    );
    questions.add(
      Question(
          question: 'What car is this?',
          answer: 'Cape MK4',
          hints: [
            Hint(text: 'It has the letters MK in it.'),
            Hint(text: 'It contains the number 4.'),
          ],
          imageURL: 'assets/images/Cape_MK4_Front.webp',
          category: 'cars'),
    );
    questions.add(
      Question(
          question: 'What car is this?',
          answer: 'Supernova',
          hints: [
            Hint(text: 'It happens in space.'),
            Hint(text: 'It\'s one word that contains "nova".'),
          ],
          imageURL: 'assets/images/Supernova_Front.webp',
          category: 'cars'),
    );
  }

  void toggleTheme() {
    isDarkModeOn = !isDarkModeOn;
    notifyListeners();
  }

  void toggleHint(Question question, int index) {
    question.hints[index].toggleHint();
    notifyListeners();
  }
}
