import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:his_quiz/quiz_rounds/pick_n_answer_round/winner_list/round_3_winner_list_screen.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/widgets/common_button.dart';

class Round3QuizResultPopUpScreen extends StatefulWidget {
  const Round3QuizResultPopUpScreen({super.key});

  @override
  State<Round3QuizResultPopUpScreen> createState() =>
      _Round3QuizResultPopUpScreenState();
}

class _Round3QuizResultPopUpScreenState
    extends State<Round3QuizResultPopUpScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  bool visible = false;

  int passedStudents = 2;
  int failedStudents = 1;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    )..repeat(
        reverse: true,
      );

    animation = Tween<double>(
      begin: 1,
      end: 1.4,
    ).animate(controller);

    Timer(
        const Duration(
          milliseconds: 300,
        ), () {
      setState(() {
        visible = true;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget rowData(String title, int value, bool isFailed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            value.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isFailed ? CommonColors.redColor : CommonColors.greenColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 130,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 600,
                        ),
                        width: 80 * animation.value,
                        height: 80 * animation.value,
                        decoration: BoxDecoration(
                          color: CommonColors.primary.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 400,
                        ),
                        width: 63 * animation.value,
                        height: 63 * animation.value,
                        decoration: BoxDecoration(
                          color: CommonColors.primary.withOpacity(0.4),
                          shape: BoxShape.circle,
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        width: 47,
                        height: 47,
                        decoration: const BoxDecoration(
                          color: CommonColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: visible ? 1.0 : 0.0,
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        child: SvgPicture.asset(
                          ImagePath.winnerIcon,
                          height: 25,
                          width: 25,
                          colorFilter: const ColorFilter.mode(
                            CommonColors.whiteColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        // child: const Icon(
                        //   Icons.delete_outline_rounded,
                        //   color: CommonColors.whiteColor,
                        //   size: 30,
                        // ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const Text(
              "Quiz Result",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: CommonColors.primary,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            rowData(
              "Students for next round",
              passedStudents,
              false,
            ),
            rowData(
              "Failed students",
              failedStudents,
              true,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: CommonDialogButton(
                    title: "Review Winner List",
                    leftButton: false,
                    onTap: () {
                      Get.back();
                      Get.to(
                        Round3WinnerListScreen(
                          numbersOfPassedStudents: passedStudents,
                          numbersOfFailedStudents: failedStudents,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
