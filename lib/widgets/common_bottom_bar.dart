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
        height:70,
        color: CommonColors.primary,
        child: Row(
          children: [
            Image.asset(
              ImagePath.logo,
              // width: 120,
              height: double.infinity,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(ImagePath.hisQuizFooter),
              )
            ),
            Image.asset(
              ImagePath.powerBY,
              height: 35,
            ),
          ],
        ),
      ),
    ],
  );
}
