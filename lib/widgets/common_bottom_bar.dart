import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';

commonBottomBar() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        height: Get.width * 0.2,
        color: CommonColors.primary,
        child: Row(
          children: [
            Image.asset(
              ImagePath.logo,
              width: 120,
              height: 64,
            ),
            Expanded(
              child: Text(
                "HIS-Quiz",
                textAlign: TextAlign.center,
                style: CommonTextStyle.regular700.copyWith(
                  fontSize: 20,
                ),
              ),
            ),
            Image.asset(
              ImagePath.powerBY,
              height: 45,
            ),
          ],
        ),
      ),
    ],
  );
}
