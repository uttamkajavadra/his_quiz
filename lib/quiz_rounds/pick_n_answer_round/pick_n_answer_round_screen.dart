import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:his_quiz/quiz_rounds/pick_n_answer_round/group_wise/group_wise_pick_n_answer_round_screen.dart';
import 'package:his_quiz/quiz_rounds/pick_n_answer_round/student_wise/student_wise_pick_n_answer_round_screen.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';
import 'package:his_quiz/widgets/common_button.dart';

class PickNAnswerRoundScreen extends StatefulWidget {
  final bool isGroupWiseRound;
  final int totalStudents;
  final int questionTime;

  const PickNAnswerRoundScreen({
    super.key,
    required this.totalStudents,
    required this.questionTime,
    required this.isGroupWiseRound,
  });

  @override
  State<PickNAnswerRoundScreen> createState() => _PickNAnswerRoundScreenState();
}

class _PickNAnswerRoundScreenState extends State<PickNAnswerRoundScreen> {
  // Set initial countdown time in seconds
  int remainingSeconds = 60;
  Timer? timer;

  List<int> answerOptions = [12, 15, 211, 220, 65, 45, 86, 82, 72];

  // Set to track selected answers
  // Set<int> selectedAnswers = {}; // Select multiple answer
  int? selectedAnswerIndex; // Select single answer

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
      body: SingleChildScrollView(
        child: Column(
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Student No :",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "1/${widget.totalStudents}",
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
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    ImagePath.student2Image,
                    width: 140,
                    height: 140,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Giovani Romaguera",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: CommonColors.textBlackColor,
                  ),
                ),
                const Text(
                  "Delhi Public School",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: CommonColors.hintTextColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 283,
              width: 280,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 32,
                  crossAxisSpacing: 32,
                  childAspectRatio: 2,
                ),
                itemCount: answerOptions.length,
                itemBuilder: (context, index) {
                  // Select multiple answer
                  // bool isSelected =
                  //     selectedAnswers.contains(answerOptions[index]);

                  // Select single answer
                  bool isSelected = selectedAnswerIndex == index;
                  return SizedBox(
                    height: 50,
                    width: 72,
                    child: GestureDetector(
                      onTap: () {
                        // Select multiple answer
                        // setState(() {
                        //   if (isSelected) {
                        //     selectedAnswers.remove(answerOptions[index]);
                        //   } else {
                        //     selectedAnswers.add(answerOptions[index]);
                        //   }
                        // });

                        // Select single answer
                        setState(() {
                          selectedAnswerIndex = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected
                              ? CommonColors.primary
                              : CommonColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isSelected
                                ? CommonColors.primary
                                : Colors.black12,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          answerOptions[index].toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? CommonColors.whiteColor
                                : CommonColors.textBlackColor,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Visibility(
              visible: selectedAnswerIndex != null,
              child: Padding(
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
                    widget.isGroupWiseRound
                        ? Get.to(
                            GroupWisePickNAnswerRoundScreen(
                              totalStudents: widget.totalStudents,
                              questionTime: widget.questionTime,
                              questionNumber: 12,
                            ),
                          )
                        : Get.to(
                            StudentWisePickNAnswerRoundScreen(
                              totalStudents: widget.totalStudents,
                              questionTime: widget.questionTime,
                              questionNumber: 12,
                            ),
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: commonBottomBar(),
    );
  }
}
