import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/config/text_style.dart';
import 'package:his_quiz/view/competition_seasons/competition_seasons_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashToute();
  }

  splashToute() async {
    await Future.delayed(
      Duration(seconds: 3),
      () {
        Get.to(() => CompetitionSeasons());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagePath.splashBackGroundImage),
                fit: BoxFit.cover)),
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
                ),
                Text(
                  "HIS-Quiz 2025",
                  style: AppTextStyle.regular900.copyWith(fontSize: 22),
                )
              ],
            )),
            Padding(
              padding: const EdgeInsets.only(bottom: 62),
              child: Image.asset(ImagePath.splashPowerBY),
            ),
          ],
        ),
      ),
    );
  }
}
