import 'package:flutter/material.dart';
import 'package:wellbeingapp/controllers/sign_up_controller.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberPicker extends StatelessWidget {
  const PhoneNumberPicker({
    super.key,
    required this.signUpController,
  });

  final SignUpController signUpController;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      
      controller: signUpController.mobileController,
      dropdownIconPosition: IconPosition.trailing,
     
      showCountryFlag: false,
    decoration: InputDecoration(
        // labelText: 'Phone Number',
        hintText: "Phone Number",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
           
        ),
    ),
    initialCountryCode: 'IN',
    onChanged: (phone) {
        print(phone.completeNumber);
    },
);
  }
}
