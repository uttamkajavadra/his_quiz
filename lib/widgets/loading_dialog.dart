import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_colors.dart';

showLoadingDialog() {
  return Future.delayed(
    Duration.zero,
    () {
      Get.dialog(
        Center(
          child: Material(
            color: CommonColors.transparentColor,
            child: Container(
              decoration: BoxDecoration(
                // color: CommonColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const CircularProgressIndicator(
                color: CommonColors.primary,
              ),
            ),
          ),
        ),
        barrierDismissible: false,
      );
    },
  );
}

void hideLoadingDialog({
  bool isTrue = false,
}) {
  Get.back(
    closeOverlays: isTrue,
  );
}
