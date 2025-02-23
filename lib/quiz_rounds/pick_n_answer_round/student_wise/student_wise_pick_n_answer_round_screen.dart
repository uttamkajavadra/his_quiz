import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:his_quiz/globals.dart';
import 'package:his_quiz/quiz_rounds/pick_n_answer_round/pop_up_screens/round_3_quiz_result_pop_up_screen.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/quiz_rounds/sudden_death_round/round_4_screen.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';
import 'package:his_quiz/widgets/common_button.dart';

class StudentWisePickNAnswerRoundScreen extends StatefulWidget {
  final int totalStudents;
  final int questionTime;
  final int questionNumber;

  const StudentWisePickNAnswerRoundScreen({
    super.key,
    required this.totalStudents,
    required this.questionTime,
    required this.questionNumber,
  });

  @override
  State<StudentWisePickNAnswerRoundScreen> createState() =>
      _StudentWisePickNAnswerRoundScreenState();
}

class _StudentWisePickNAnswerRoundScreenState
    extends State<StudentWisePickNAnswerRoundScreen> {
  // Set initial countdown time in seconds
  int remainingSeconds = 60;
  int answerTimer = Global.timer;
  Timer? timer;

  // Maximum time in seconds (answer time + question time)
  int maxTime = 0;

  List<int> answerOptions = [12, 15, 211, 220, 65, 45, 86, 82, 72];

  // Set to track selected answers
  // Set<int> selectedAnswers = {}; // Select multiple answer
  int? selectedAnswerIndex; // Select single answer

  List<String> options = [
    "Respiration",
    "Photosynthesis",
    "Decomposition",
    "Fermentation",
  ];

  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.questionTime;
    maxTime = Global.timer + widget.questionTime;
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;

          // Set answer time
          answerTimer++;
        });

        // Check if the maximum time is reached
        if (answerTimer >= maxTime) {
          timer.cancel();

          // Set answer timer
          Global.timer = answerTimer;

          // Redirect to the desired screen
          if (Global.role == "student") {
            // Set answer timer
            Global.timer = answerTimer;

            Get.to(
              // Round4Screen(
              //   totalStudents: widget.totalStudent,
              //   questionTime: int.parse(
              //     addTimeController.text,
              //   ),
              // ),
              const Round4Screen(
                totalStudents: 3,
                questionTime: 30,
              ),
            );
          } else {
            // Set answer timer
            Global.timer = answerTimer;

            Get.dialog(
              const Round3QuizResultPopUpScreen(),
            );
          }
        }
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
          //               "Pick 'N' Answer",
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
                      "Pick 'N' Answer",
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
                            // formatTime(remainingSeconds),
                            formatTime(answerTimer),
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
          Text(
            "Question No. ${widget.questionNumber}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
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
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              "What is the process called when plants make their own food from sunlight?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              itemCount: options.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedAnswerIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 12,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: selectedAnswerIndex == index
                          ? CommonColors.primary.withOpacity(0.1)
                          : CommonColors.whiteColor,
                      border: Border.all(
                        color: selectedAnswerIndex == index
                            ? CommonColors.primary
                            : Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        options[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: selectedAnswerIndex == index
                              ? CommonColors.primary
                              : CommonColors.blackColor,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
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
                if (Global.role == "student") {
                  // Set answer timer
                  Global.timer = answerTimer;

                  Get.to(
                    // Round4Screen(
                    //   totalStudents: widget.totalStudent,
                    //   questionTime: int.parse(
                    //     addTimeController.text,
                    //   ),
                    // ),
                    const Round4Screen(
                      totalStudents: 3,
                      questionTime: 30,
                    ),
                  );
                } else {
                  // Set answer timer
                  Global.timer = answerTimer;

                  Get.dialog(
                    const Round3QuizResultPopUpScreen(),
                  );
                }
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
