import 'package:get/get.dart';
import 'package:his_quiz/models/questions.dart';

class QuizController extends GetxController {
  List<Questions> round1Questions = [
    Questions(
      questionText: 'What is the largest planet in our Solar System?',
      options: [
        'Earth',
        'Mars',
        'Jupiter',
        'Venus',
      ],
      selectedOption: 0,
    ),
  ].obs;

  List<Questions> round2Questions = [
    Questions(
      questionText: '1. What is the largest planet in our solar system?',
      options: [
        'Earth',
        'Mars',
        'Jupiter',
        'Venus',
      ],
      selectedOption: 0,
    ),
    Questions(
      questionText: '2. What is the largest planet in our solar system?',
      options: [
        'Earth',
        'Mars',
        'Jupiter',
        'Venus',
      ],
      selectedOption: 0,
    ),
  ].obs;

  List<Questions> round3Questions = [
    Questions(
      questionText: '25. What is the largest planet in our solar system?',
      options: [
        'Earth',
        'Mars',
        'Jupiter',
        'Venus',
      ],
      selectedOption: 0,
    ),
    Questions(
      questionText: '30. What is the largest planet in our solar system?',
      options: [
        'Earth',
        'Mars',
        'Jupiter',
        'Venus',
      ],
      selectedOption: 0,
    ),
  ].obs;

  List<Questions> round4Questions = [
    Questions(
      questionText: '1. What is the largest planet in our solar system?',
      options: [
        'Earth',
        'Mars',
        'Jupiter',
        'Venus',
      ],
      selectedOption: 0,
    ),
    Questions(
      questionText: '2. What is the largest planet in our solar system?',
      options: [
        'Earth',
        'Mars',
        'Jupiter',
        'Venus',
      ],
      selectedOption: 0,
    ),
    Questions(
      questionText: '3. What is the largest planet in our solar system?',
      options: [
        'Earth',
        'Mars',
        'Jupiter',
        'Venus',
      ],
      selectedOption: 0,
    ),
  ].obs;

  // void selectOption(int questionIndex, int optionIndex) {
  //   round1Questions[questionIndex].selectedOption = optionIndex;
  //   update();
  // }
}
