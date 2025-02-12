import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/screens/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Splash Screen
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        Get.offAll(
          const LoginScreen(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              ImagePath.splashBackGroundImage,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImagePath.logo,
                    width: Get.width * 0.7,
                    height: 212,
                  ),
                  Text(
                    "HIS-Quiz 2025",
                    style: CommonTextStyle.regular700.copyWith(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                bottom: 62,
              ),
              width: double.infinity,
              child: Image.asset(
                ImagePath.splashPowerBY,
                height: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
