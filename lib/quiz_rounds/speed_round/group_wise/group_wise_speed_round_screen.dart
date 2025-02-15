import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/globals.dart';
import 'package:his_quiz/quiz_rounds/best_answer_round/round_2_screen.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';
import 'package:his_quiz/widgets/common_button.dart';
import 'package:his_quiz/widgets/common_dialog.dart';

class GroupWiseSpeedRoundScreen extends StatefulWidget {
  final int currentGroupNumber;
  final int totalGroupNumber;
  const GroupWiseSpeedRoundScreen({
    super.key,
    required this.currentGroupNumber,
    required this.totalGroupNumber,
  });

  @override
  State<GroupWiseSpeedRoundScreen> createState() =>
      _GroupWiseSpeedRoundScreenState();
}

class _GroupWiseSpeedRoundScreenState extends State<GroupWiseSpeedRoundScreen> {
  List<String> options = [
    "Earth",
    "Mars",
    "Jupiter",
    "Venus",
  ];

  int? selectedAnswerIndex;

  // Set initial countdown time in seconds
  int remainingSeconds = 60;
  Timer? timer;

  @override
  void initState() {
    super.initState();
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
          //               "Speed Round",
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
                      "Speed Round",
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
                        "Group No : ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "${widget.currentGroupNumber}/${widget.totalGroupNumber}",
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
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      "What is the largest planet in our solar system?",
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
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
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
                  Global.role == "student"
                      ? GestureDetector(
                          onTap: () {
                            Get.to(
                                // Round2Screen(
                                //   isGroupWiseRound: true,
                                //   currentNumber: 2,
                                //   totalNumber: totalGroups,
                                //   totalQuestions: int.parse(
                                //     numberOfQuestionController.text,
                                //   ),
                                //   questionTime: int.parse(
                                //     addTimeController.text,
                                //   ),
                                // ),
                                const Round2Screen(
                                  isGroupWiseRound: true,
                                  currentNumber: 2,
                                  totalNumber: 20,
                                  totalQuestions: 5,
                                  questionTime: 30,
                                ),
                              );
                          },
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFFF04438),
                                  Color(0xFFFF766C),
                                ],
                              ),
                            ),
                          ).paddingOnly(
                            top: 20,
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                            border: Border.all(
                              color: CommonColors.primary.withOpacity(0.3),
                            ),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey.withOpacity(0.2),
                            //     blurRadius: 8,
                            //     spreadRadius: 2,
                            //   ),
                            // ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  right: 8,
                                ),
                                child: Image.asset(
                                  ImagePath.studentImage,
                                  height: 64,
                                  width: 64,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Giovani Romaguera",
                                      style:
                                          CommonTextStyle.regular500.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                            style: CommonTextStyle.regular400
                                                .copyWith(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Container(
                              //   margin: const EdgeInsets.only(
                              //     left: 8,
                              //   ),
                              //   child: SvgPicture.asset(
                              //     ImagePath.progressIcon,
                              //     height: 52,
                              //     width: 52,
                              //   ),
                              // ),
                              Container(
                                width: 52,
                                height: 52,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFF00FF11),
                                      Color(0xFF1DED2B),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ).paddingOnly(
                          left: 20,
                          right: 20,
                        ),
                ],
              ),
            ),
          ),
          if (Global.role != "student")
            const SizedBox(
              height: 10,
            ),
          if (Global.role != "student")
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
                    const QuizResultRound1Dialog(),
                  );
                },
              ),
            ),
          if (Global.role != "student")
            const SizedBox(
              height: 20,
            ),
        ],
      ),
      bottomNavigationBar: commonBottomBar(),
    );
  }
}
