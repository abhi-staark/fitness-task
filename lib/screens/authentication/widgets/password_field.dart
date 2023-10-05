import 'package:flutter/material.dart';
import 'package:wellbeingapp/controllers/sign_up_controller.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.signUpController,
  });

  final SignUpController signUpController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      controller: signUpController.passwordController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Enter password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null; // Return null if validation passes
  }
    );
  }
}

