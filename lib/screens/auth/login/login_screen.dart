import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/screens/compitition_seasons/compitition_seasons_screen.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';
import 'package:his_quiz/widgets/common_button.dart';
import 'package:his_quiz/widgets/common_text_field.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              // User Name
              CommonAuthField(
                titleText: "User Name",
                hintText: "Enter User name",
                controller: userNameController,
              ),

              const SizedBox(
                height: 20,
              ),

              // Password
              CommonAuthField(
                titleText: "Password",
                hintText: "Enter Password",
                controller: passwordController,
                isPassword: obscurePassword,
              ),

              // const SizedBox(height: 40),
              const Spacer(),

              // LOGIN BUTTON
              CommonButton(
                child: isLoading
                    ? const CircularProgressIndicator(
                        color: CommonColors.whiteColor,
                      )
                    : Text(
                        "Login",
                        style: CommonTextStyle.bold.copyWith(
                          fontSize: 16,
                          color: CommonColors.whiteColor,
                        ),
                      ),
                onPressed: () {
                  setState(() {
                    isLoading = true;
                  });

                  Timer(
                    const Duration(
                      seconds: 2,
                    ),
                    () {
                      Get.offAll(
                        const CompititionSeasonsScreen(),
                      );
                    },
                  );
                },
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: commonBottomBar(),
    );
  }
}
