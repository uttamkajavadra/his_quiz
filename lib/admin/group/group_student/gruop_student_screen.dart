import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/admin/group/group_student/components/card_widget_group_student.dart';
import 'package:his_quiz/admin/speed_round/round_1/round_1_screen.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';
import 'package:his_quiz/widgets/common_button.dart';

class GruopStudentScreen extends StatefulWidget {
  final int groupNumber;
  final int studentsPerGroup;
  final int totalGroups;
  const GruopStudentScreen({
    super.key,
    required this.groupNumber,
    required this.studentsPerGroup,
    required this.totalGroups,
  });

  @override
  State<GruopStudentScreen> createState() => _GruopStudentScreenState();
}

class _GruopStudentScreenState extends State<GruopStudentScreen> {
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
                      "Group ${widget.groupNumber}",
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
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                    ),
                    child: Text(
                      "${widget.studentsPerGroup} Students",
                      textAlign: TextAlign.left,
                      style: CommonTextStyle.regular700.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: widget.studentsPerGroup,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    itemBuilder: (context, index) {
                      return CardWidgetGroupStudent(
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CommonButton(
              child: Text(
                "Start Quiz",
                style: CommonTextStyle.bold.copyWith(
                  fontSize: 16,
                  color: CommonColors.whiteColor,
                ),
              ),
              onPressed: () {
                Get.to(
                  Round1Screen(
                    isGroupWiseRound: true,
                    currentNumber: widget.groupNumber,
                    totalNumber: widget.totalGroups,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: commonBottomBar(),
    );
  }
}
