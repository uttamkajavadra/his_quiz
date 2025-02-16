import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/levels/select_country_screen.dart';
import 'package:his_quiz/students_screen/student_list/student_list_screen.dart';

class CardWidgetLevelSelection extends StatefulWidget {
  final int index;
  final String levelName;
  final String assetName;

  const CardWidgetLevelSelection({
    super.key,
    required this.index,
    required this.levelName,
    required this.assetName,
  });

  @override
  State<CardWidgetLevelSelection> createState() => _CardWidgetLevelSelection();
}

class _CardWidgetLevelSelection extends State<CardWidgetLevelSelection> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.levelName == "National"
            ? Get.to(
                const StudentListScreen(),
              )
            : Get.to(
                const SelectCountryScreen(),
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
                widget.levelName,
                style: CommonTextStyle.regular600.copyWith(
                  fontSize: 18,
                  color: CommonColors.blackColor,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                widget.assetName,
                height: 32,
                width: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
