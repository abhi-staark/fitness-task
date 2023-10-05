import 'package:flutter/material.dart';
import 'package:wellbeingapp/controllers/sign_up_controller.dart';

class AgeField extends StatelessWidget {
  const AgeField({
    super.key,
    required this.signUpController,
  });

  final SignUpController signUpController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signUpController.ageController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Age',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Age';
        }
        return null;
      },
    );
  }
}

