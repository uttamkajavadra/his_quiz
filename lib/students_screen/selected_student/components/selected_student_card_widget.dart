import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/widgets/common_dialog.dart';

class SelectedStudentCardWidget extends StatefulWidget {
  final int index;

  const SelectedStudentCardWidget({
    super.key,
    required this.index,
  });

  @override
  State<SelectedStudentCardWidget> createState() =>
      _SelectedStudentCardWidgetState();
}

class _SelectedStudentCardWidgetState extends State<SelectedStudentCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(
        //   const StudentDetailsScreen(),
        // );
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}
