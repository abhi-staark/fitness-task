import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbeingapp/controllers/exercise_controller.dart';
import 'package:wellbeingapp/data/repository/quotes_api_service.dart';
import 'package:wellbeingapp/models/exercise_model/exercise_model.dart';
import 'package:wellbeingapp/models/quotes_model.dart';

class TimerScreenController extends GetxController {
  ExerciseController exerciseController = Get.put(ExerciseController());
  RxList<Quote> quotes = [Quote(id: 1, quote: " ", author: " ")].obs;

  Future<void> fetchQuotes() async {
    final ApiService apiService = ApiService();
    try {
      final List<Quote> fetchedQuotes = await apiService.fetchQuotes();
      quotes.value = fetchedQuotes;
    } catch (e) {
      print('Error: $e');
    }
  }

  void showCongratulationsDialog(Exercise exercise) {
    showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Congratulations!'),
          content: const Text('You have completed the Exercise'),
          actions: <Widget>[
            TextButton(
              child: const Text('Yay!'),
              onPressed: () {
                exerciseController.exerciseData.add(Exercise(
                    exercise.name,
                    exercise.instructions,
                    exercise.difficulty,
                    exercise.image,
                    true,
                    exercise.videoPath));
                exerciseController.exerciseData.remove(exercise);

                Get.back();
                // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

    String getFormattedTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }

}
