import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/compitition_seasons/components/icon_title_widget.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/host/host_year_and_subject/host_year_and_subject_screen.dart';

class HostInternationalCardWidget extends StatefulWidget {
  final int index;
  const HostInternationalCardWidget({
    super.key,
    required this.index,
  });

  @override
  State<HostInternationalCardWidget> createState() =>
      _HostInternationalCardWidgetState();
}

class _HostInternationalCardWidgetState
    extends State<HostInternationalCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          const HostYearAndSubjectScreen(),
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
                    title: "6th to 7th May",
                  ),
                  IconTitleWidget(
                    imagePath: ImagePath.locationIcon,
                    title: "Jamaica",
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                  ),
                  IconTitleWidget(
                    imagePath: ImagePath.homeIcon,
                    title: "Delta Careers College",
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
