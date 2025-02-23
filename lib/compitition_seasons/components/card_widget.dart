import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/globals.dart';
import 'package:his_quiz/year_and_subject/year_and_subject_screen.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/compitition_seasons/components/icon_title_widget.dart';

class CardWidget extends StatefulWidget {
  final int index;

  const CardWidget({
    super.key,
    required this.index,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Global.competitionStatus == "upcoming"
            ? null
            : Get.to(
                const YearAndSubjectScreen(),
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
            Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 22,
              ),
              color: CommonColors.primary,
              child: Text(
                "SEASON\n${widget.index + 1}",
                textAlign: TextAlign.center,
                style: CommonTextStyle.regular500.copyWith(
                  fontSize: 16,
                  color: CommonColors.whiteColor,
                ),
              ),
            ),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconTitleWidget(
                    imagePath: ImagePath.calendarIcon,
                    title: "9th to 10th April",
                  ),
                  IconTitleWidget(
                    imagePath: ImagePath.locationIcon,
                    title: "United Kingdom",
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                  ),
                  IconTitleWidget(
                    imagePath: ImagePath.homeIcon,
                    title: "Delta Careers College ",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
