import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_text_style.dart';

commonAppBar({
  List<Widget>? actions,
  Widget? leading,
  String? title,
}) async {
  return SafeArea(
    child: Container(
      height: 60,
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      // color: AppColors.blackColor,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: leading ??
                const Icon(
                  Icons.arrow_back_ios_new_rounded,
                ),
          ),
          Expanded(
            child: Text(
              title ?? "",
              textAlign: TextAlign.center,
              style: CommonTextStyle.regular600.copyWith(
                fontSize: 20,
              ),
            ),
          ),
          Row(
            children: actions ??
                [
                  const SizedBox(
                    width: 24,
                  ),
                ],
          ),
        ],
      ),
    ),
  );
}
