import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:his_quiz/globals.dart';
import 'package:his_quiz/quiz_rounds/pick_n_answer_round/pick_n_answer_round_screen.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';
import 'package:his_quiz/widgets/common_button.dart';

class Round3Screen extends StatefulWidget {
  final bool isGroupWiseRound;
  final int totalStudents;
  final int questionTime;
  const Round3Screen({
    super.key,
    required this.isGroupWiseRound,
    required this.totalStudents,
    required this.questionTime,
  });

  @override
  State<Round3Screen> createState() => _Round3ScreenState();
}

class _Round3ScreenState extends State<Round3Screen> {
  final FlutterTts flutterTts = FlutterTts();

  // Track speaking status
  bool isSpeaking = false;

  final String description = """
Lorem ipsum dolor sit amet consectetur. Varius pretium cursus laoreet eu amet cursus euismod felis. Orci sed sit vulputate urna curabitur pellentesque. Lorem ipsum dolor sit amet consectetur. Varius pretium cursus laoreet eu amet cursus euismod felis. Orci sed sit vulputate urna curabitur pellentesque.""";

  @override
  void initState() {
    super.initState();

    // Check for TTS Availability
    checkTts();

    // Monitor speech progress
    flutterTts.setProgressHandler((
      String text,
      int start,
      int end,
      String word,
    ) {
      setState(() {
        isSpeaking = true;
      });
      log("Speaking... $word");
    });

    // Monitor when speaking is complete
    flutterTts.setCancelHandler(() {
      setState(() {
        isSpeaking = false;
      });
      log("Speech cancelled.");
    });

    flutterTts.setPauseHandler(() {
      setState(() {
        isSpeaking = false;
      });
      log("Speech paused.");
    });

    flutterTts.setContinueHandler(() {
      setState(() {
        isSpeaking = true;
      });
      log("Speech resumed.");
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeaking = false;
      });
      log("Speech completed.");
    });

    // Redirect for student flow
    Future.delayed(
      const Duration(
        seconds: 5,
      ),
      () {
        if (Global.role == "student") {
          // Stop speech before navigating
          flutterTts.stop();
          setState(() {
            isSpeaking = false;
          });

          Get.to(
            PickNAnswerRoundScreen(
              totalStudents: widget.totalStudents,
              questionTime: widget.questionTime,
              isGroupWiseRound: widget.isGroupWiseRound,
            ),
          );
        }
      },
    );
  }

  Future<void> checkTts() async {
    var engines = await flutterTts.getEngines;
    log("Available TTS Engines: $engines");
  }

  Future<void> speak() async {
    try {
      if (isSpeaking) {
        // Stop speech
        await flutterTts.stop();
        isSpeaking = false;
        log("Speech stopped.");
      } else {
        await flutterTts.setLanguage("en-US");
        await flutterTts.setPitch(1.0);
        await flutterTts.setSpeechRate(0.5);

        // await flutterTts.speak(
        //   description,
        // );

        var result = await flutterTts.speak(description);
        if (result == 1) {
          isSpeaking = true;
          log("Speaking...");
        } else {
          log("Failed to speak.");
        }
      }
    } catch (e) {
      log("Error: $e");
    }
  }

  @override
  void dispose() {
    flutterTts.stop();
    isSpeaking = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // commonAppBar(
          //   title: "Competition Seasons",
          // ),
          // SafeArea(
          //   child: Container(
          //     height: 60,
          //     padding: const EdgeInsets.only(
          //       left: 16,
          //       right: 16,
          //     ),
          //     // color: AppColors.blackColor,
          //     child: Row(
          //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         InkWell(
          //           onTap: () {
          //             Get.back();
          //           },
          //           child: const Icon(
          //             Icons.arrow_back_ios_new_rounded,
          //           ),
          //         ),
          //         Expanded(
          //           child: Text(
          //             "Round 3",
          //             textAlign: TextAlign.center,
          //             style: CommonTextStyle.regular600.copyWith(
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         // Row(
          //         //   children: actions ??
          //         //       [
          //         //         const SizedBox(
          //         //           width: 24,
          //         //         ),
          //         //       ],
          //         // ),
          //       ],
          //     ),
          //   ),
          // ),
          SafeArea(
            child: Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                children: [
                  // Back Button
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                      ),
                    ),
                  ),

                  // Centered Title
                  Center(
                    child: Text(
                      "Round 3",
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
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 180,
                    width: 180,
                    padding: const EdgeInsets.all(16),
                    child: SvgPicture.asset(
                      ImagePath.round3Icon,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Pick N Answer Round",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: CommonColors.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: CommonColors.hintTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      speak();
                    },
                    child: Container(
                      height: 32,
                      width: 32,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: CommonColors.primary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: SvgPicture.asset(
                        ImagePath.volumnIcon,
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          if (Global.role != 'student')
            Visibility(
              visible: !isSpeaking,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: CommonButton(
                  child: Text(
                    "Start Round 3",
                    style: CommonTextStyle.bold.copyWith(
                      fontSize: 16,
                      color: CommonColors.whiteColor,
                    ),
                  ),
                  onPressed: () {
                    // Stop speech before navigating
                    flutterTts.stop();
                    setState(() {
                      isSpeaking = false;
                    });

                    Get.to(
                      PickNAnswerRoundScreen(
                        totalStudents: widget.totalStudents,
                        questionTime: widget.questionTime,
                        isGroupWiseRound: widget.isGroupWiseRound,
                      ),
                    );
                  },
                ),
              ),
            ),
          if (Global.role != 'student')
            const SizedBox(
              height: 20,
            ),
        ],
      ),
      bottomNavigationBar: commonBottomBar(),
    );
  }
}
