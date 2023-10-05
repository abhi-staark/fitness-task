import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellbeingapp/constants/file_paths/files_path.dart';
import 'package:wellbeingapp/constants/theme/theme.dart';
import 'package:wellbeingapp/controllers/exercise_controller.dart';
import 'package:wellbeingapp/controllers/timer_controller.dart';
import 'package:wellbeingapp/models/exercise_model/exercise_model.dart';
import 'dart:async';
import 'dart:math';

import 'package:wellbeingapp/screens/exercises/screens/timer_painter.dart';

class TimerScreen extends StatefulWidget {
  final Exercise exercise = Get.arguments as Exercise;
  bool isMusicEnabled;

  TimerScreen({super.key, required this.isMusicEnabled});

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  final TimerScreenController timerScreenController =
      Get.put(TimerScreenController());

  int _secondsRemaining = 10;
  int totalTime = 10;
  final player = AudioPlayer();

  late Timer _timer;
  bool _isTimerComplete = false;
  final ConfettiController _confettiController = ConfettiController();
  final ExerciseController exerciseController = Get.put(ExerciseController());

  @override
  void initState() {
    super.initState();
    startTimer();
    playMusic();
    timerScreenController.fetchQuotes();
  }

  void changeIsPlaying() async {
    setState(() {
      widget.isMusicEnabled = !(widget.isMusicEnabled);
    });
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isPlayerEnabled', widget.isMusicEnabled);
  }

  void playMusic() {
    if (widget.isMusicEnabled) {
      player.play(AssetSource(musicMp3));
    }
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
          _isTimerComplete = true;
          _confettiController.play();
          timerScreenController.showCongratulationsDialog(widget.exercise);
        }
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ThemeClass.lightTheme.scaffoldBackgroundColor,
        title: Text(
          'WellBeing',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 22),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              player.stop();
              player.dispose(); //for stopping music
              Get.back();
            }),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.exercise.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: IconButton(
                    icon: Icon(
                        widget.isMusicEnabled ? Icons.pause : Icons.play_arrow),
                    iconSize: 35,
                    onPressed: () {
                      changeIsPlaying();

                      if (!widget.isMusicEnabled) {
                        player.stop();
                      } else {
                        player.play(AssetSource(musicMp3));
                      }
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(
              () => Column(
                children: [
                  Text(
                    timerScreenController.quotes[0].quote,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "- ${timerScreenController.quotes[0].author}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
            child: CustomPaint(
              size: const Size(200, 200),
              painter: TimerPainter(
                timeRemaining: _secondsRemaining,
                totalTime: totalTime,
              ),
              child: _isTimerComplete
                  ? ConfettiWidget(
                      blastDirectionality: BlastDirectionality.explosive,
                      shouldLoop: true,
                      confettiController: _confettiController,
                      blastDirection: pi / 1.5,
                      emissionFrequency: 0.01,
                      numberOfParticles: 80,
                      maxBlastForce: 100,
                      minBlastForce: 80,
                      gravity: 0.05,
                      colors: const [Colors.green, Colors.blue, Colors.pink],
                    )
                  : Center(
                      child: Text(
                        timerScreenController.getFormattedTime(_secondsRemaining),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
   player.dispose();
    super.dispose();
  }
}

