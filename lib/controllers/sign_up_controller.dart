import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbeingapp/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxString selectedGender = 'Male'.obs;

  Future signUpUser(UserDetails userDetails) async {
    // Save user details and login status to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', userDetails.name);
    prefs.setString('email', userDetails.email);
    prefs.setString('phoneNumber', userDetails.phoneNumber);
    prefs.setDouble('height', userDetails.height);
    prefs.setDouble('weight', userDetails.weight);
    prefs.setDouble('age', userDetails.age);
    prefs.setString('gender', userDetails.gender);
    prefs.setString('password', userDetails.password);
    prefs.setBool('isLogin', true); // Assuming user is now logged in
  print("User details saved");
  }

 Future<UserDetails> getUserDetailsFromPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  bool isLogin = prefs.getBool('isLogin') ?? false;

  if (isLogin) {
    // User is logged in, retrieve user details
    String name = prefs.getString('name') ?? '';
    String email = prefs.getString('email') ?? '';
    String phoneNumber = prefs.getString('phoneNumber') ?? '';
    double height = prefs.getDouble('height') ?? 0.0;
    double weight = prefs.getDouble('weight') ?? 0.0;
    double age = prefs.getDouble('age') ?? 0.0;
    String gender = prefs.getString('gender') ?? '';
    String password = prefs.getString('password') ?? '';

    // Create a UserDetails object
    UserDetails userDetails = UserDetails(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      height: height,
      weight: weight,
      age: age,
      gender: gender,
      password: password,
    );

    // Return the UserDetails object
    return userDetails;
  } else {
    // User is not logged in, return an empty UserDetails object
    return UserDetails(

       name: '',
      email: '',
      phoneNumber: '',
      height: 0.0,
      weight: 0.0,
      age: 0.0,
      gender: '',
      password: '',
    );
  }
}


}
