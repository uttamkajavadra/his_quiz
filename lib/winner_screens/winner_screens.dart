import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:his_quiz/screens/login/login_screen.dart';
import 'package:his_quiz/winner_screens/components/winner_screen_title_subtitle.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';
import 'package:his_quiz/widgets/common_button.dart';

class WinnerScreens extends StatefulWidget {
  const WinnerScreens({super.key});

  @override
  State<WinnerScreens> createState() => _WinnerScreensState();
}

class _WinnerScreensState extends State<WinnerScreens> {
  final ConfettiController confettiController = ConfettiController(
    duration: const Duration(
      seconds: 5,
    ),
  );

  @override
  void initState() {
    super.initState();
    confettiController.play();
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: commonBottomBar(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              // commonAppBar(title: "Jerome Bell"),
              SafeArea(
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Winner",
                          textAlign: TextAlign.center,
                          style: CommonTextStyle.regular600.copyWith(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    top: 12,
                    left: 24,
                    right: 24,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: SvgPicture.asset(
                          ImagePath.trophyIcon,
                          height: 126,
                          width: 126,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Winner",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: CommonColors.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              right: 8,
                            ),
                            child: Image.asset(
                              ImagePath.studentImage,
                              height: 52,
                              width: 52,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Giovani Romaguera",
                                  style: CommonTextStyle.regular500.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      ImagePath.homeIcon,
                                      width: 22,
                                      height: 22,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 3,
                                      ),
                                      child: Text(
                                        "Delhi Public School",
                                        style:
                                            CommonTextStyle.regular400.copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const WinnerScreenTitleSubtitle(
                        title: "Sutdent Name",
                        subTitle: "Sigmund Legros",
                      ),
                      const WinnerScreenTitleSubtitle(
                        title: "City",
                        subTitle: "28 Headlands Kettering",
                      ),
                      const WinnerScreenTitleSubtitle(
                        title: "Email",
                        subTitle: " Headlands, Kettering",
                      ),
                      const WinnerScreenTitleSubtitle(
                        title: "State",
                        subTitle: "sigmundlegros@gmail.com",
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              // mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'State',
                                  style: CommonTextStyle.regular600.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  width: 150,
                                  height: 150,
                                  alignment: Alignment.center,
                                  decoration: ShapeDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        ImagePath.walesCity,
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Center(
                                  child: Text(
                                    'Wales',
                                    textAlign: TextAlign.center,
                                    style: CommonTextStyle.regular600.copyWith(
                                      fontSize: 16,
                                      color: CommonColors.gretTextTextColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Country',
                                  style: CommonTextStyle.regular600.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  width: 150,
                                  height: 150,
                                  decoration: ShapeDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        ImagePath.unitedKingdom,
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Center(
                                  child: Text(
                                    'United Kingdom',
                                    textAlign: TextAlign.center,
                                    style: CommonTextStyle.regular600.copyWith(
                                      fontSize: 16,
                                      color: CommonColors.gretTextTextColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 48,
                          bottom: 48,
                        ),
                        child: CommonButton(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Done",
                                  style: CommonTextStyle.bold.copyWith(
                                    fontSize: 16,
                                    color: CommonColors.whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Get.offAll(
                              const LoginScreen(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          ConfettiWidget(
            confettiController: confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            emissionFrequency: 0.2,
            numberOfParticles: 50,
            maxBlastForce: 100,
            minBlastForce: 80,
            gravity: 0.03,
            shouldLoop: false,
            colors: const [
              CommonColors.confettiColor1,
              CommonColors.confettiColor2,
              CommonColors.confettiColor3,
              CommonColors.confettiColor4,
            ],
          ),
        ],
      ),
    );
  }
}
