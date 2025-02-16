import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/screens/splash/splash_screen.dart';

late List<CameraDescription> cameras;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'His Quiz',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: CommonColors.primary,
        ),
        fontFamily: "Inter",
        scaffoldBackgroundColor: CommonColors.scaffoldBackgroundColor,
        primaryColor: CommonColors.primary,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: CommonColors.textBlackColor,
          ),
        ),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
