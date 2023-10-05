import 'package:flutter/material.dart';
import 'package:wellbeingapp/controllers/sign_up_controller.dart';

class HeightField extends StatelessWidget {
  const HeightField({
    super.key,
    required this.signUpController,
  });

  final SignUpController signUpController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signUpController.heightController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Height',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter height';
        }
        return null;
      },
    );
  }
}

