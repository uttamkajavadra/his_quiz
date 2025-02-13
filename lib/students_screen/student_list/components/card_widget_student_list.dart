import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/globals.dart';
import 'package:his_quiz/models/students_data.dart';
import 'package:his_quiz/quiz_rounds/quiz_details/quiz_details_screen.dart';
import 'package:his_quiz/students_screen/selected_student/selected_student_screen.dart';
import 'package:his_quiz/students_screen/student_details/student_details_screen.dart';
import 'package:his_quiz/widgets/common_dialog.dart';

class CardWidgetStudentList extends StatefulWidget {
  final int index;
  final bool isSelectedStudentScreen;
  final StudentsData studentsData;

  const CardWidgetStudentList({
    super.key,
    this.isSelectedStudentScreen = false,
    required this.index,
    required this.studentsData,
  });

  @override
  State<CardWidgetStudentList> createState() => _CardWidgetStudentListState();
}

class _CardWidgetStudentListState extends State<CardWidgetStudentList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (Global.competitionStatus == "past") {
          await Get.to(
            QuizDetailsScreen(
              studentsData: widget.studentsData,
            ),
          );
        } else {
          if (widget.isSelectedStudentScreen) {
            await Get.to(
              const SelectedStudentScreen(),
            );
          } else {
            await Get.to(
              const StudentDetailsScreen(),
            );
          }
        }
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
              margin: const EdgeInsets.only(
                right: 8,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 0,
              ),
              child: Image.asset(
                widget.studentsData.image,
                height: 64,
                width: 64,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.studentsData.name,
                    style: CommonTextStyle.regular500.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImagePath.homeIcon,
                        width: 22,
                        height: 22,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 3,
                        ),
                        child: Text(
                          widget.studentsData.schoolName,
                          style: CommonTextStyle.regular400.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            if (Global.competitionStatus != "past")
              IconButton(
                onPressed: () {
                  Get.dialog(
                    const RemoveStudentDialog(),
                  );
                },
                icon: const Icon(
                  Icons.delete_outline,
                  color: CommonColors.redAccent,
                ),
              ),
            if (Global.role == 'admin')
              if (Global.competitionStatus == 'past')
                if (widget.studentsData.isWinner)
                  Column(
                    children: [
                      SvgPicture.asset(
                        ImagePath.trophyIcon,
                        height: 30,
                        width: 30,
                      ),
                      const Text(
                        "Winner",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: CommonColors.primary,
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
