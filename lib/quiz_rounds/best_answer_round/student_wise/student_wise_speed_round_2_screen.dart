import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:his_quiz/quiz_rounds/best_answer_round/student_wise/components/card_widget_student_wise_round_2.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';
import 'package:his_quiz/widgets/common_button.dart';
import 'package:his_quiz/widgets/common_dialog.dart';

class StudentWiseSpeedRound2Screen extends StatefulWidget {
  final int questionTime;
  final int currentQuestionNumber;
  final int totalQuestionNumber;

  const StudentWiseSpeedRound2Screen({
    super.key,
    required this.questionTime,
    required this.currentQuestionNumber,
    required this.totalQuestionNumber,
  });

  @override
  State<StudentWiseSpeedRound2Screen> createState() =>
      _StudentWiseSpeedRound2ScreenState();
}

class _StudentWiseSpeedRound2ScreenState
    extends State<StudentWiseSpeedRound2Screen> {
  // Set initial countdown time in seconds
  int remainingSeconds = 60;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.questionTime;
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    // Cancel the timer when widget is removed
    timer?.cancel();
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
          //           child: Center(
          //             child: Text(
          //               "Best Answer",
          //               textAlign: TextAlign.center,
          //               style: CommonTextStyle.regular600.copyWith(
          //                 fontSize: 20,
          //               ),
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
          //         Container(
          //           padding: const EdgeInsets.symmetric(
          //             horizontal: 8,
          //             vertical: 4,
          //           ),
          //           decoration: BoxDecoration(
          //             color: CommonColors.primary.withOpacity(0.1),
          //             borderRadius: BorderRadius.circular(8),
          //           ),
          //           child: Row(
          //             children: [
          //               SvgPicture.asset(
          //                 ImagePath.timerIcon,
          //                 height: 18,
          //                 width: 18,
          //               ),
          //               const SizedBox(
          //                 width: 4,
          //               ),
          //               Text(
          //                 formatTime(remainingSeconds),
          //                 style: const TextStyle(
          //                   fontSize: 14,
          //                   fontWeight: FontWeight.w400,
          //                   color: Colors.orange,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
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
                      "Best Answer",
                      textAlign: TextAlign.center,
                      style: CommonTextStyle.regular600.copyWith(
                        fontSize: 20,
                      ),
                    ),
                  ),

                  // Timer on the Right
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: CommonColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            ImagePath.timerIcon,
                            height: 18,
                            width: 18,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            formatTime(remainingSeconds),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Question No :",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "${widget.currentQuestionNumber}/${widget.totalQuestionNumber}",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: CommonColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFFEA9539),
                              Color(0xFFE66334),
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.diagonal3Values(
                              -1,
                              1,
                              1,
                            ),
                            child: CircularProgressIndicator(
                              value: remainingSeconds / widget.questionTime,
                              strokeWidth: 6,
                              backgroundColor: CommonColors.whiteColor,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                CommonColors.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '$remainingSeconds',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: CommonColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    itemBuilder: (context, index) {
                      return CardWidgetStudentWiseRound2(
                        index: index,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: CommonButton(
              child: Text(
                "Next",
                style: CommonTextStyle.bold.copyWith(
                  fontSize: 16,
                  color: CommonColors.whiteColor,
                ),
              ),
              onPressed: () {
                Get.dialog(
                  const QuizResultRound2Dialog(),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
      bottomNavigationBar: commonBottomBar(),
    );
  }
}
