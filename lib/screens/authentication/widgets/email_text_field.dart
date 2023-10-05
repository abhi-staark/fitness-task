import 'package:flutter/material.dart';
import 'package:wellbeingapp/controllers/sign_up_controller.dart';

class EmialPicker extends StatelessWidget {
  const EmialPicker({
    super.key,
    required this.signUpController,
  });

  final SignUpController signUpController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signUpController.emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Enter email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter alternate email';
        }
        return null;
      },
    );
  }
}

