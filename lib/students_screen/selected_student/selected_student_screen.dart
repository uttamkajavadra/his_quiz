import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/quiz_rounds/speed_round/round_1_screen.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/students_screen/selected_student/components/selected_student_card_widget.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';
import 'package:his_quiz/widgets/common_button.dart';
import 'package:his_quiz/widgets/common_dialog.dart';
import 'package:his_quiz/widgets/common_text_field.dart';

class SelectedStudentScreen extends StatefulWidget {
  const SelectedStudentScreen({super.key});

  @override
  State<SelectedStudentScreen> createState() => _SelectedStudentScreenState();
}

class _SelectedStudentScreenState extends State<SelectedStudentScreen> {
  String sortingValue = "Name A to Z";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: commonBottomBar(),
      body: Column(
        children: [
          // commonAppBar(title: "Selacted Student List"),
          SafeArea(
            child: Container(
              height: 60,
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              // color: AppColors.blackColor,
              child: Row(
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
                      "Selacted Student List",
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
          const Padding(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            child: CommonSearchField(
              hintText: "Search Students",
              icon: Icons.search,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "200 Selected Students",
                  textAlign: TextAlign.left,
                  style: CommonTextStyle.regular700.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    itemCount: 15,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    itemBuilder: (context, index) {
                      return SelectedStudentCardWidget(
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
            child: Row(
              children: [
                Expanded(
                  child: CommonDialogButton(
                    title: "Divide Group",
                    leftButton: true,
                    onTap: () {
                      Get.dialog(
                        const DivideGroupRound1Dialog(
                          // Static value
                          totalStudent: 200,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: CommonDialogButton(
                    title: "Start Round 1",
                    leftButton: false,
                    onTap: () {
                      Get.to(
                        const Round1Screen(
                          isGroupWiseRound: false,
                          currentNumber: 20,
                          totalNumber: 200,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
