import 'package:flutter/material.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/globals.dart';

commonBottomBar() {
  return Stack(
    // mainAxisSize: MainAxisSize.min,
    alignment: Alignment.center,
    children: [
      Container(
        height: 70,
        color: CommonColors.primary,
        margin: EdgeInsets.only(top: (Global.role.toString() == "admin")?20:0),
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
              child: (Global.role.toString() != "admin")
                ?Image.asset(ImagePath.hisQuizFooter)
                : const SizedBox(),
            )),
            Image.asset(
              ImagePath.powerBY,
              height: 35,
            ),
          ],
        ),
      ),
      if(Global.role.toString() == "admin") Positioned(
        top: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: CommonColors.primary,
            borderRadius: BorderRadius.circular(8)
          ),
          child: Text("Upload sponsor ads", style: CommonTextStyle.button.copyWith(color: CommonColors.whiteColor, decoration: TextDecoration.underline, decorationColor: CommonColors.whiteColor),),
        ),
      )
    ],
  );
}
