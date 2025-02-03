import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/app_colors.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/config/text_style.dart';
import 'package:his_quiz/view/student_screens/face_verificatopn_screen.dart';
import 'package:his_quiz/view/student_screens/student_screen.dart';
import 'package:his_quiz/widget/app_button.dart';
import 'package:his_quiz/widget/common_appbar.dart';

class StudenDetailScreen extends StatefulWidget {
  const StudenDetailScreen({
    super.key,
  });

  @override
  State<StudenDetailScreen> createState() => _StudenDetailScreenState();
}

class _StudenDetailScreenState extends State<StudenDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: commonBottomBar(),
      body: Column(
        children: [
          commonAppBar(title: "Jerome Bell"),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 12, left: 24, right: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: Get.width * 0.3,
                    height: Get.width * 0.3,
                    margin: EdgeInsets.only(bottom: 24),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImagePath.studentImage),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleSubtitle("Sutdent Name", "Sigmund Legros"),
                      titleSubtitle(
                          "School Address", "OPENING MINDS, OPENING DOORS"),
                      titleSubtitle("City", "28 Headlands Kettering"),
                      titleSubtitle("Email", " Headlands, Kettering"),
                      titleSubtitle("State", "sigmundlegros@gmail.com"),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              // mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('State',
                                    style: AppTextStyle.regular600
                                        .copyWith(fontSize: 14)),
                                const SizedBox(height: 8),
                                Container(
                                  width: 150,
                                  height: 150,
                                  alignment: Alignment.center,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(ImagePath.walesCity),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Center(
                                  child: Text('Wales',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.regular600.copyWith(
                                        fontSize: 16,
                                        color: AppColors.gretTextTextColor,
                                      )),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Country',
                                    style: AppTextStyle.regular600
                                        .copyWith(fontSize: 14)),
                                const SizedBox(height: 8),
                                Container(
                                  width: 150,
                                  height: 150,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage(ImagePath.unitedKingdom),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Center(
                                  child: Text('United Kingdom',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.regular600.copyWith(
                                        fontSize: 16,
                                        color: AppColors.gretTextTextColor,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      commonButton(
                          title: "Verify Face",
                          margin: EdgeInsets.only(top: 48),
                          isFront: true,
                          isExpand: true,
                          onTap: () async {
                          await  Get.off(()=>FaceVerificatopnScreen());
                          },
                          frontImage: ImagePath.faceScan,
                          frontImageHeight: 20),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  titleSubtitle(title, subtitle) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: AppTextStyle.regular600.copyWith(fontSize: 14)),
          const SizedBox(width: 8),
          Expanded(
            child: SizedBox(
              child: Text(subtitle,
                  textAlign: TextAlign.right,
                  style: AppTextStyle.regular600.copyWith(
                    fontSize: 14,
                    color: AppColors.gretTextTextColor,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
