import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/screens/students_screen/selected_student/selected_student_screen.dart';
import 'package:his_quiz/screens/students_screen/student_details/student_details_screen.dart';

class CardWidgetStudentList extends StatefulWidget {
  final int index;
  final bool isSelectedStudentScreen;

  const CardWidgetStudentList({
    super.key,
    this.isSelectedStudentScreen = false,
    required this.index,
  });

  @override
  State<CardWidgetStudentList> createState() => _CardWidgetStudentListState();
}

class _CardWidgetStudentListState extends State<CardWidgetStudentList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (widget.isSelectedStudentScreen) {
          await Get.to(
            const SelectedStudentScreen(),
          );
        } else {
          await Get.to(
            const StudentDetailsScreen(),
          );
        }
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
                ImagePath.studentImage,
                height: 64,
                width: 64,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Giovani Romaguera",
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
                          "Delhi Public School",
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
          ],
        ),
      ),
    );
  }
}
