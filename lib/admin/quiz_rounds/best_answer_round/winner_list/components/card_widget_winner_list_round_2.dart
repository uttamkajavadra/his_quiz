import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/widgets/common_dialog.dart';

class CardWidgetWinnerListRound2 extends StatefulWidget {
  final int index;

  const CardWidgetWinnerListRound2({
    super.key,
    required this.index,
  });

  @override
  State<CardWidgetWinnerListRound2> createState() =>
      _CardWidgetWinnerListRound2State();
}

class _CardWidgetWinnerListRound2State
    extends State<CardWidgetWinnerListRound2> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {},
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
        child: Column(
          children: [
            Row(
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
            Divider(
              color: Colors.orange.shade50,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Total Score",
                    style: CommonTextStyle.regular500.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                const Text(
                  "80/100",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: CommonColors.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
