import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/app_colors.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/config/text_style.dart';

commonAppBar({
  List<Widget>? actions ,
  Widget? leading,
String? title
}) {
  return SafeArea(
    child: Container(
        height: 60,
        padding: EdgeInsets.only(left: 16, right: 16),
        // color: AppColors.blackColor,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(onTap: () {
              Get.back();
            },child: leading??Icon(Icons.arrow_back_ios_new_rounded)),
            Expanded(
              child: Text(
                title??"",
                textAlign: TextAlign.center,
                style: AppTextStyle.regular600.copyWith(fontSize: 20),
              ),
            ),
            Row(
              children: actions??[
                SizedBox(width: 24,),
              ],
            )
            // Expanded(child: ),
          ],
        )),
  );
}


commonBottomBar(){
  return  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: Get.width*0.2,
            color: AppColors.primary,
            child: Row(
              // mainAxisAlignment: ,
              children: [
                Image.asset(ImagePath.logo,width: 120,height: 64,),
                Expanded(child: Text("HIS-Quiz",textAlign: TextAlign.center,style: AppTextStyle.regular700.copyWith(fontSize: 20),)),
                Image.asset(ImagePath.powerBY,height: 45,)
              ],
            ),
          ),
        ],
      );
}