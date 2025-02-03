import 'package:his_quiz/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/view/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "His Quiz",
      theme: ThemeData(
        fontFamily: "Inter",
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        primaryColor: AppColors.primary,
        textTheme:   TextTheme(
          bodyMedium: TextStyle(color: AppColors.textBlackColor), // Use bodyMedium instead of bodyText2
        ),
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
        ),
      ),
      // home: const OfferScreen(),
      home: SplashScreen(),
    );
  }
}
