import 'package:get/get.dart';
import 'package:wellbeingapp/constants/file_paths/files_path.dart';
import 'package:wellbeingapp/models/exercise_model/exercise_model.dart';
class ExerciseController extends GetxController {
  
  var exerciseData = <Exercise>[
    Exercise(
        "Diamond Push-Ups",
        "1. Begin in a plank position with your hands close together, forming a diamond shape with your thumbs and index fingers. Hands should be under your shoulders.\n2. Keep your body straight from head to heels and engage your core muscles.\n3. Gradually lower your chest toward your hands by bending your elbows. Ensure your elbows point backward and slightly outward during this phase. \n4. Lower your body as far as your strength and flexibility allow while keeping good form. \n5. Push your body back up to the starting position by straightening your arms. Exhale as you push upward. \n6. Focus on engaging your chest, triceps, and shoulders to lift your body.",
        "Easy",
        diamondUImage,
        false,
        diamondUpsVideo
        ),
    Exercise(
        "High-Knee Sprints",
        "1. Stand upright with your feet hip-width apart.\n2. Begin jogging in place at a comfortable pace.As you jog, lift your knees as high as possible with each step. \n3. Coordinate your arm movements with your knee lifts. Swing your arms naturally as if you were running. \n4. Maintain steady and controlled breathing throughout the exercise. Inhale and exhale rhythmically. \n5. Engage your core muscles to help lift your knees higher.",
        "Medium",
        highKneesImage,
        false,
        highKneesVideo
        ),
    Exercise(
        "Bottom Ups",
        "1. Stand with your feet shoulder-width apart. \n2. Extend your arms straight out in front of you at shoulder height. Your palms should face downward, and your fingers should point toward the ground.\n3. Begin the squat by pushing your hips back and bending your knees. \n4. Lower your body as if you were sitting back into a chair. Keep your back straight and chest up. \n5. Lower your body until your thighs are parallel to the ground, or as far as your mobility allows while maintaining proper form. \n6. Push through your heels and engage your quadriceps and glutes to rise back up to the starting position.",
        "Hard",
        bottomUpsImage,
        false,
        bottomUpsVideo
        ),
  ].obs;
}
