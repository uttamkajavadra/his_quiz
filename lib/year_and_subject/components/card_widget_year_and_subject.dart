import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/globals.dart';
import 'package:his_quiz/levels/level_selection_screen.dart';
import 'package:his_quiz/levels/select_country_screen.dart';

class CardWidgetYeasrAndSubject extends StatefulWidget {
  final int index;
  final String subject;
  final String description;

  const CardWidgetYeasrAndSubject({
    super.key,
    required this.index,
    required this.subject,
    required this.description,
  });

  @override
  State<CardWidgetYeasrAndSubject> createState() =>
      _CardWidgetYeasrAndSubjectState();
}

class _CardWidgetYeasrAndSubjectState extends State<CardWidgetYeasrAndSubject> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          Global.competitionStatus == "past"
              ? const SelectCountryScreen()
              : const LevelSelectionScreen(),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: CommonColors.whiteColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.orange.shade50,
          ),
        ),
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 70,
                alignment: Alignment.center,
                // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  widget.subject,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: CommonColors.whiteColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  widget.description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: CommonColors.textBlackColor,
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
