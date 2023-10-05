import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbeingapp/common_widgets/custom_appbar.dart';
import 'package:wellbeingapp/screens/exercises/screens/exercise_instructions_page.dart';
import '../../../controllers/exercise_controller.dart'; // Import the ExerciseController

class ExerciseListPage extends StatelessWidget {
  final ExerciseController controller = Get.put(ExerciseController());

   ExerciseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'WellBeing'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Obx(
          () => ListView.builder(
            itemCount: controller.exerciseData.length,
            itemBuilder: (context, index) {
              final exercise = controller.exerciseData[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(28, 8, 8, 10),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: Text(
                        exercise.name,
                        style:
                            const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                    subtitle: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Text('Difficulty: '),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              exercise.difficulty,
                              style: TextStyle(
                                  color: exercise.difficulty == 'Easy'
                                      ? Colors.green
                                      : exercise.difficulty == 'Medium'
                                          ? const Color.fromARGB(255, 209, 193, 48)
                                          : Colors.red),
                            )
                          ],
                        ),
                        const SizedBox(
                                height: 10,
                              ),
                        Row(
                          children: [
                            const Text('Status: '),
                            Text(
                              exercise.status ? 'Completed' : 'Not Completed',
                              style: TextStyle(
                                  color: exercise.status
                                      ? Colors.green
                                      : Colors.red),
                            )
                          ],
                        ),
                      ],
                    ),
                    trailing: SizedBox(
                      height: 200,
                      width: 100,
                      child: Image.asset(
                        exercise.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    onTap: () {
                      Get.to(const ExerciseInstructionsPage(), arguments: exercise);
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
