import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellbeingapp/constants/theme/theme.dart';
import 'package:wellbeingapp/screens/exercises/screens/exercise_list_page.dart';
import 'package:wellbeingapp/screens/exercises/widgets/video_player.dart';
import 'package:wellbeingapp/screens/home/home_screen.dart';
import 'screens/authentication/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check if the user is logged in using SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  bool isLogin = prefs.getBool('isLogin') ?? false;

  runApp(MyApp(isLogin: isLogin));
}

class MyApp extends StatelessWidget {
  final bool isLogin;

  const MyApp({Key? key, required this.isLogin}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeClass.lightTheme,
      home: //VideoPlayerScreen()
      isLogin
          ? ExerciseListPage()
          : SignUpScreen(), // Navigate to HomeScreen if logged in, else navigate to SignUpScreen
    );
  }
}
