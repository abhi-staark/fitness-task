import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellbeingapp/common_widgets/custom_appbar.dart';
import 'package:wellbeingapp/models/exercise_model/exercise_model.dart';
import 'package:wellbeingapp/screens/exercises/screens/timer.dart';
import 'package:wellbeingapp/screens/exercises/widgets/video_player.dart';

class ExerciseInstructionsPage extends StatelessWidget {
  const ExerciseInstructionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Exercise exercise = Get.arguments as Exercise;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: const CustomAppBar(title: 'WellBeing'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.name,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 10),
                Text('Instructions:',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                //video player
                SizedBox(
                    height: 200,
                    child: VideoPlayerScreen(
                      videoAssetPath: exercise.videoPath,
                    )),
                const SizedBox(height: 10),
                Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: exercise.instructions.split('\n').map((point) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                point,
                                textAlign: TextAlign.start,
                              ),
                            ))
                          ],
                        );
                      }).toList(),
                    )),
              ],
            ),
          ),
        ),
        floatingActionButton: InkWell(
          onTap: () async {
            final prefs = await SharedPreferences.getInstance();
            bool isMusicEnabled = prefs.getBool('isPlayerEnabled') ?? true;
            print("muscis status: $isMusicEnabled");
            Get.off(TimerScreen(isMusicEnabled: isMusicEnabled,));
          },
          child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.orange),
              child: Center(
                  child: Text(
                'Start',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              ))),
        ));
  }
}
