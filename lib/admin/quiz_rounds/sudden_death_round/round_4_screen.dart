import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:his_quiz/admin/quiz_rounds/sudden_death_round/sudden_death_round_screen.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';
import 'package:his_quiz/widgets/common_button.dart';

class Round4Screen extends StatefulWidget {
  final int totalStudents;
  final int questionTime;
  const Round4Screen({
    super.key,
    required this.totalStudents,
    required this.questionTime,
  });

  @override
  State<Round4Screen> createState() => _Round4ScreenState();
}

class _Round4ScreenState extends State<Round4Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // commonAppBar(
          //   title: "Competition Seasons",
          // ),
          SafeArea(
            child: Container(
              height: 60,
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              // color: AppColors.blackColor,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Round 4",
                      textAlign: TextAlign.center,
                      style: CommonTextStyle.regular600.copyWith(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  // Row(
                  //   children: actions ??
                  //       [
                  //         const SizedBox(
                  //           width: 24,
                  //         ),
                  //       ],
                  // ),
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
                    decoration: BoxDecoration(
                      color: CommonColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: SvgPicture.asset(
                      ImagePath.round4Icon,
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
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      """
Lorem ipsum dolor sit amet consectetur. Varius pretium cursus laoreet eu amet cursus euismod felis. Orci sed sit vulputate urna curabitur pellentesque. Lorem ipsum dolor sit amet consectetur. Varius pretium cursus laoreet eu amet cursus euismod felis. Orci sed sit vulputate urna curabitur pellentesque.""",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: CommonColors.hintTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(14),
                      backgroundColor: CommonColors.primary,
                    ),
                    child: const Icon(
                      Icons.volume_up,
                      color: CommonColors.whiteColor,
                    ),
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
                "Start Round 4",
                style: CommonTextStyle.bold.copyWith(
                  fontSize: 16,
                  color: CommonColors.whiteColor,
                ),
              ),
              onPressed: () {
                Get.to(
                  SuddenDeathRoundScreen(
                    currentStudents: 1,
                    totalStudents: widget.totalStudents,
                    questionTime: widget.questionTime,
                  ),
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
