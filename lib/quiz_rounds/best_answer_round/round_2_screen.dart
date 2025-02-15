import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:his_quiz/globals.dart';
import 'package:his_quiz/quiz_rounds/best_answer_round/group_wise/group_wise_speed_round_2_screen.dart';
import 'package:his_quiz/quiz_rounds/best_answer_round/student_wise/student_wise_speed_round_2_screen.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';
import 'package:his_quiz/widgets/common_button.dart';

class Round2Screen extends StatefulWidget {
  final bool isGroupWiseRound;
  final int currentNumber;
  final int totalNumber;
  final int totalQuestions;
  final int questionTime;
  const Round2Screen({
    super.key,
    required this.isGroupWiseRound,
    required this.currentNumber,
    required this.totalNumber,
    required this.totalQuestions,
    required this.questionTime,
  });

  @override
  State<Round2Screen> createState() => _Round2ScreenState();
}

class _Round2ScreenState extends State<Round2Screen> {
  final FlutterTts flutterTts = FlutterTts();

  final String description = """
Lorem ipsum dolor sit amet consectetur. Varius pretium cursus laoreet eu amet cursus euismod felis. Orci sed sit vulputate urna curabitur pellentesque. Lorem ipsum dolor sit amet consectetur. Varius pretium cursus laoreet eu amet cursus euismod felis. Orci sed sit vulputate urna curabitur pellentesque.""";

  @override
  void initState() {
    super.initState();

    // Redirect for student flow
    Future.delayed(
      const Duration(
        seconds: 5,
      ),
      () {
        widget.isGroupWiseRound
            ? Get.to(
                GroupWiseSpeedRound2Screen(
                  currentGroupNumber: widget.currentNumber,
                  totalGroupNumber: widget.totalNumber,
                  questionTime: widget.questionTime,
                  currentQuestionNumber: 5,
                  totalQuestionNumber: widget.totalQuestions,
                ),
              )
            : Get.to(
                StudentWiseSpeedRound2Screen(
                  questionTime: widget.questionTime,
                  currentQuestionNumber: 5,
                  totalQuestionNumber: widget.totalQuestions,
                ),
              );
      },
    );
  }

  Future<void> speak() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);

    await flutterTts.speak(
      description,
    );
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
          //             "Round 2",
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
                      "Round 2",
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
                      ImagePath.round2Icon,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Best Answer Round",
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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: CommonButton(
                child: Text(
                  "Start Round 2",
                  style: CommonTextStyle.bold.copyWith(
                    fontSize: 16,
                    color: CommonColors.whiteColor,
                  ),
                ),
                onPressed: () {
                  widget.isGroupWiseRound
                      ? Get.to(
                          GroupWiseSpeedRound2Screen(
                            currentGroupNumber: widget.currentNumber,
                            totalGroupNumber: widget.totalNumber,
                            questionTime: widget.questionTime,
                            currentQuestionNumber: 5,
                            totalQuestionNumber: widget.totalQuestions,
                          ),
                        )
                      : Get.to(
                          StudentWiseSpeedRound2Screen(
                            questionTime: widget.questionTime,
                            currentQuestionNumber: 5,
                            totalQuestionNumber: widget.totalQuestions,
                          ),
                        );
                },
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
