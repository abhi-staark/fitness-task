import 'package:flutter/material.dart';
import 'package:wellbeingapp/controllers/sign_up_controller.dart';

class NameTextFormField extends StatelessWidget {
  const NameTextFormField({
    super.key,
    required this.controller,
  });

 final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.nameController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: 'Enter Full Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter employee name';
        }
        return null;
      },
    );
  }
}
