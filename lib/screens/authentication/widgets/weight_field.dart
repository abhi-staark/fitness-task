import 'package:flutter/material.dart';
import 'package:wellbeingapp/controllers/sign_up_controller.dart';

class WeightField extends StatelessWidget {
  const WeightField({
    super.key,
    required this.signUpController,
  });

  final SignUpController signUpController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signUpController.weightController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Weight',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter weight';
        }
        return null;
      },
    );
  }
}

