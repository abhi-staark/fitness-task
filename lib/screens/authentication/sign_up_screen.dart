import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbeingapp/controllers/sign_up_controller.dart';
import 'package:wellbeingapp/models/user_model.dart';
import 'package:wellbeingapp/screens/authentication/widgets/sign_up_header_widget.dart';
import 'package:wellbeingapp/screens/exercises/screens/exercise_list_page.dart';
import 'package:wellbeingapp/screens/authentication/widgets/age_field.dart';
import 'package:wellbeingapp/screens/authentication/widgets/email_text_field.dart';
import 'package:wellbeingapp/screens/authentication/widgets/height_field.dart';
import 'package:wellbeingapp/screens/authentication/widgets/mobile_field.dart';
import 'package:wellbeingapp/screens/authentication/widgets/name_field.dart';
import 'package:wellbeingapp/screens/authentication/widgets/password_field.dart';
import 'package:wellbeingapp/screens/authentication/widgets/weight_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObsecure = true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final SignUpController signUpController = Get.put(SignUpController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: signUpController.formKey, // Add the form key here
                  autovalidateMode:
                      AutovalidateMode.disabled, // Enable auto-validation

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SignUpScreenHeaderWidget(),
                      const SizedBox(height: 10),
                      NameTextFormField(controller: signUpController),
                      // textField(
                      //   width * 0.9,
                      //   _nameController,
                      //   "Name",
                      //   const Icon(
                      //     Icons.person,
                      //     color: Colors.black,
                      //   ),
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please enter your name';
                      //     }
                      //     return null; // Return null for successful validation
                      //   },
                      // ),

                      SizedBox(height: height * .02),

                      EmialPicker(
                        signUpController: signUpController,
                      ),
                      // textField(
                      //   width * 0.9,
                      //   _emailController,
                      //   "Email",
                      //   const Icon(
                      //     Icons.email,
                      //     color: Colors.black,
                      //   ),
                      //   isEmail: true,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please enter your email';
                      //     }
                      //     // Add email format validation if needed
                      //     return null;
                      //   },
                      // ),
                      SizedBox(height: height * .02),
                      PhoneNumberPicker(
                        signUpController: signUpController,
                      ),
                      // textField(
                      //   width * 0.9,
                      //   _mobileController,
                      //   "Mobile Number",
                      //   const Icon(
                      //     Icons.phone,
                      //     color: Colors.black,
                      //   ),
                      //   isNumber: true,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please enter your mobile number';
                      //     }
                      //     // Add mobile number format validation if needed
                      //     return null;
                      //   },
                      // ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * 0.4,
                            child:
                                HeightField(signUpController: signUpController),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: width * 0.4,
                            child:
                                WeightField(signUpController: signUpController),
                          )
                          // textField(
                          //   width * 0.45,
                          //   _heightController,
                          //   "Height",
                          //   const Icon(
                          //     Icons.height,
                          //     color: Colors.black,
                          //   ),
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Please enter your height';
                          //     }
                          //     // Add height format validation if needed
                          //     return null;
                          //   },
                          // ),
                          // textField(
                          //   width * 0.45,
                          //   _weightController,
                          //   "Weight",
                          //   const Icon(
                          //     Icons.numbers,
                          //     color: Colors.black,
                          //   ),
                          //   isNumber: true,
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Please enter your weight';
                          //     }
                          //     // Add weight format validation if needed
                          //     return null;
                          //   },
                          // ),
                        ],
                      ),
                      SizedBox(height: height * .02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * 0.4,
                            child: AgeField(signUpController: signUpController),
                          ),
                          // textField(
                          //   width * 0.45,
                          //   _ageController,
                          //   "Age",
                          //   const Icon(
                          //     Icons.people,
                          //     color: Colors.black,
                          //   ),
                          //   isNumber: true,
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Please enter your age';
                          //     }
                          //     // Add age format validation if needed
                          //     return null;
                          //   },
                          // ),
                          const GenderDropdown(),
                        ],
                      ),
                      SizedBox(height: height * .02),
                      PasswordField(signUpController: signUpController),

                      // Container(
                      //   width: width * .9,
                      //   decoration: BoxDecoration(
                      //       color: const Color.fromARGB(69, 158, 158, 158),
                      //       borderRadius: BorderRadius.circular(10)),
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 15, vertical: 5),
                      //     child: TextFormField(
                      //       obscureText: isObsecure,
                      //       style: const TextStyle(
                      //           color: Colors.black, fontSize: 18),
                      //       decoration: InputDecoration(
                      //         prefixIcon: const Icon(
                      //           Icons.fingerprint,
                      //           color: Colors.black,
                      //         ),
                      //         enabledBorder: InputBorder.none,
                      //         focusedBorder: InputBorder.none,
                      //         hintText: "Password",
                      //         hintStyle: const TextStyle(
                      //             color: Colors.black38, fontSize: 14),
                      //         suffixIcon: IconButton(
                      //           onPressed: () {
                      //             setState(() {
                      //               isObsecure = !isObsecure;
                      //             });
                      //           },
                      //           icon: Icon(
                      //             isObsecure
                      //                 ? Icons.visibility_off
                      //                 : Icons.visibility,
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //       ),
                      //       validator: (value) {
                      //         if (value == null || value.isEmpty) {
                      //           return 'Please enter a password';
                      //         }
                      //         // Add password format/validation rules if needed
                      //         return null;
                      //       },
                      //     ),
                      //   ),
                      // ),

                      SizedBox(height: height * .02),
                      GestureDetector(
                        onTap: () async{
                          if (signUpController.formKey.currentState!
                              .validate()) {
                            final userDetails = UserDetails(
                                name: signUpController.nameController.text,
                                email: signUpController.emailController.text,
                                phoneNumber:
                                    signUpController.mobileController.text,
                                height: double.tryParse(signUpController
                                        .heightController.text) ??
                                    0.0,
                                weight: double.tryParse(signUpController
                                        .weightController.text) ??
                                    0.0,
                                age: double.tryParse(
                                        signUpController.ageController.text) ??
                                    0.0,
                                gender: signUpController.selectedGender.value,
                                password:
                                    signUpController.passwordController.text);

                                     signUpController.signUpUser(userDetails);
                                    Get.to(()=> ExerciseListPage());
                           
                          }
                        },
                        child: Container(
                          width: width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text("Create Account",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already Have an account?',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.black,
                                  )),
                          TextButton(
                              onPressed: () {
                                // Get.to(() => const SignInScreen());
                              },
                              child: Text('Login',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget textField(
  //   double width,
  //   TextEditingController controller,
  //   String text,
  //   Icon icon, {
  //   bool isNumber = false,
  //   bool isEmail = false,
  //   String? Function(String?)? validator, // Validation function
  // }) {
  //   return Container(
  //     width: width,
  //     decoration: BoxDecoration(
  //         color: const Color.fromARGB(69, 158, 158, 158),
  //         borderRadius: BorderRadius.circular(10)),
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
  //       child: TextFormField(
  //         controller: controller,
  //         keyboardType: isNumber
  //             ? TextInputType.number
  //             : isEmail
  //                 ? TextInputType.emailAddress
  //                 : TextInputType.text,
  //         style: const TextStyle(color: Colors.black, fontSize: 18),
  //         decoration: InputDecoration(
  //           prefixIcon: icon,
  //           enabledBorder: InputBorder.none,
  //           focusedBorder: InputBorder.none,
  //           hintText: text,
  //           hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
  //         ),
  //         validator: validator, // Pass the validation function
  //       ),
  //     ),
  //   );
  // }
}

class GenderDropdown extends StatefulWidget {
  const GenderDropdown({super.key});

  @override
  _GenderDropdownState createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  // String selectedGender = 'Male'; // Default selected value
  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.width * 0.14,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          //color: const Color.fromARGB(69, 158, 158, 158),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Obx(
          () => DropdownButton<String>(
            value: signUpController.selectedGender.value,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.black),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
            iconSize: 24,
            elevation: 16,
            onChanged: (String? newValue) {
              signUpController.selectedGender.value = newValue!;
            },
            items: <String>['Male', 'Female']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child:
                    Text(value, style: Theme.of(context).textTheme.bodyMedium),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
