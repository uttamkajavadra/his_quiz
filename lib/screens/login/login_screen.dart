import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/compitition_seasons/compitition_seasons_screen.dart';
import 'package:his_quiz/globals.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';
import 'package:his_quiz/widgets/common_button.dart';
import 'package:his_quiz/widgets/common_text_field.dart';
import 'package:his_quiz/widgets/loading_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;

  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(
      //       horizontal: 20.0,
      //     ),
      //     child: Form(
      //       key: formKey,
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           const SizedBox(
      //             height: 40,
      //           ),
      //           const Text(
      //             "Login",
      //             style: TextStyle(
      //               fontSize: 26,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //           const SizedBox(
      //             height: 30,
      //           ),
      //           // User Name
      //           CommonAuthField(
      //             titleText: "User Name",
      //             hintText: "Enter User name",
      //             controller: userNameController,
      //             validator: (value) {
      //               if (value!.isEmpty || value.trim().isEmpty) {
      //                 return "This username field cannot be empty";
      //               }
      //               if (value.length < 3) {
      //                 return "Username must be at least 3 characters long";
      //               }
      //               // Allow only letters, numbers, and underscores
      //               String usernamePattern = r'^[a-zA-Z0-9_]+$';
      //               RegExp regex = RegExp(usernamePattern);
      //               if (!regex.hasMatch(value)) {
      //                 return "Username can only contain letters, numbers, and underscores";
      //               }
      //               return null;
      //             },
      //           ),
      //           const SizedBox(
      //             height: 20,
      //           ),
      //           // Password
      //           CommonAuthField(
      //             titleText: "Password",
      //             hintText: "Enter Password",
      //             controller: passwordController,
      //             isPassword: obscurePassword,
      //             validator: (value) {
      //               if (value!.isEmpty || value.trim().isEmpty) {
      //                 return "This password field cannot be empty";
      //               }
      //               if (value.length < 6) {
      //                 return "Password must be at least 6 characters long";
      //               }
      //               return null;
      //             },
      //           ),
      //           // const SizedBox(height: 40),
      //           const Spacer(),
      //           // LOGIN BUTTON
      //           CommonButton(
      //             child: Text(
      //               "Login",
      //               style: CommonTextStyle.bold.copyWith(
      //                 fontSize: 16,
      //                 color: CommonColors.whiteColor,
      //               ),
      //             ),
      //             onPressed: () {
      //               if (formKey.currentState!.validate()) {
      //                 setState(() {
      //                   isLoading = true;
      //                 });
      //                 // Show Loading Dialog
      //                 showLoadingDialog();
      //                 Timer(
      //                   const Duration(
      //                     seconds: 2,
      //                   ),
      //                   () {
      //                     // Hide Loading Dialog
      //                     hideLoadingDialog();
      //                     // Redirect
      //                     if (userNameController.text == "admin") {
      //                       Global.role = "admin";
      //                       Get.offAll(
      //                         const CompititionSeasonsScreen(),
      //                       );
      //                     } else if (userNameController.text == "host") {
      //                       Global.role = "host";
      //                       Get.offAll(
      //                         const CompititionSeasonsScreen(),
      //                       );
      //                     }
      //                   },
      //                 );
      //               }
      //             },
      //           ),
      //           const Spacer(),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // User Name
                    CommonAuthField(
                      titleText: "User Name",
                      hintText: "Enter User name",
                      controller: userNameController,
                      validator: (value) {
                        if (value!.isEmpty || value.trim().isEmpty) {
                          return "This username field cannot be empty";
                        }
                        if (value.length < 3) {
                          return "Username must be at least 3 characters long";
                        }
                        String usernamePattern = r'^[a-zA-Z0-9_]+$';
                        RegExp regex = RegExp(usernamePattern);
                        if (!regex.hasMatch(value)) {
                          return "Username can only contain letters, numbers, and underscores";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    // Password
                    CommonAuthField(
                      titleText: "Password",
                      hintText: "Enter Password",
                      controller: passwordController,
                      isPassword: obscurePassword,
                      validator: (value) {
                        if (value!.isEmpty || value.trim().isEmpty) {
                          return "This password field cannot be empty";
                        }
                        if (value.length < 6) {
                          return "Password must be at least 6 characters long";
                        }
                        return null;
                      },
                    ),

                    const Spacer(),
                  ],
                ),
              ),
            ),

            // Positioned Login Button
            Positioned(
              bottom: 30,
              left: 20,
              right: 20,
              child: CommonButton(
                child: Text(
                  "Login",
                  style: CommonTextStyle.bold.copyWith(
                    fontSize: 16,
                    color: CommonColors.whiteColor,
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      isLoading = true;
                    });

                    // Show Loading Dialog
                    showLoadingDialog();

                    Timer(
                      const Duration(seconds: 2),
                      () {
                        // Hide Loading Dialog
                        hideLoadingDialog();

                        // Redirect
                        if (userNameController.text == "admin") {
                          Global.role = "admin";
                          Get.offAll(
                            const CompititionSeasonsScreen(),
                          );
                        } else if (userNameController.text == "host") {
                          Global.role = "host";
                          Get.offAll(
                            const CompititionSeasonsScreen(),
                          );
                        }
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: commonBottomBar(),
    );
  }
}
