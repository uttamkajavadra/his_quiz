import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/screens/students_screen/student_list/student_list_screen.dart';

class CardWidgetSchoolSelection extends StatefulWidget {
  final int index;

  const CardWidgetSchoolSelection({
    super.key,
    required this.index,
  });

  @override
  State<CardWidgetSchoolSelection> createState() =>
      _CardWidgetSchoolSelectionState();
}

class _CardWidgetSchoolSelectionState extends State<CardWidgetSchoolSelection> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          const StudentListScreen(),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: CommonColors.borderColor,
          ),
        ),
        margin: const EdgeInsets.only(
          bottom: 16,
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                right: 8,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 0,
              ),
              child: Image.asset(
                ImagePath.stateImage,
                height: 64,
                width: 64,
              ),
            ),
            Expanded(
              child: Text(
                "State name",
                style: CommonTextStyle.regular500.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
