import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/admin/group/group_student/gruop_student_screen.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';

class CardWidgetReviewGroup extends StatefulWidget {
  final int index;
  final int groupNumber;
  final int studentsPerGroup;
  final int totalGroups;

  const CardWidgetReviewGroup({
    super.key,
    required this.index,
    required this.groupNumber,
    required this.studentsPerGroup,
    required this.totalGroups,
  });

  @override
  State<CardWidgetReviewGroup> createState() => _CardWidgetReviewGroupState();
}

class _CardWidgetReviewGroupState extends State<CardWidgetReviewGroup> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          GruopStudentScreen(
            groupNumber: widget.groupNumber,
            studentsPerGroup: widget.studentsPerGroup,
            totalGroups: widget.totalGroups,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: CommonColors.whiteColor,
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
            Expanded(
              child: Text(
                "Group ${widget.index + 1}",
                style: CommonTextStyle.bold.copyWith(
                  fontSize: 16,
                  color: CommonColors.primary,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
