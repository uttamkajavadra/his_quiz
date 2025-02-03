import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/app_colors.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/widget/app_button.dart';
import 'package:his_quiz/widget/common_appbar.dart';
import 'package:his_quiz/widget/dialog/verification_dialog.dart';

class FaceVerificatopnScreen extends StatefulWidget {
  const FaceVerificatopnScreen({super.key});

  @override
  State<FaceVerificatopnScreen> createState() => _FaceVerificatopnScreenState();
}

class _FaceVerificatopnScreenState extends State<FaceVerificatopnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: commonBottomBar(),
      body: Column(
        children: [
          commonAppBar(title: "Face Verification"),
          Padding(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFFB923C),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        // clipBehavior: Clip.antiAlias,
                        //     decoration: DottedDecoration(
                        //   color:AppColors.primary,
                        //   strokeWidth: 2,

                        // ),
                        child: Image.asset(
                          ImagePath.studentImage,
                          width: Get.width * 0.8,
                          height: Get.width * 0.8,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 7,
                        child: Container(
                          width: 322,
                          height: 191,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.00, -1.00),
                              end: Alignment(0, 1),
                              colors: [Color(0x00FB923C).withOpacity(0.2), Color(0xFFFB923C).withOpacity(0.2)],
                            ),
                          ),
                          // child: Container(
                          // ,
                          //   height: 6,
                          //   decoration: ShapeDecoration(
                          //     color: Color(0xFFFB923C),
                          //     shape: OvalBorder(),
                          //   ),
                          // ),
                        ),
                      ),
                    ],
                  ),
                ),
                commonButton(
                    title: "Verify Face",
                    margin: EdgeInsets.only(top: Get.height*0.1,left: 12,right: 12),
                    isFront: true,
                    isExpand: true,
                    onTap: () async {
                    await  Get.dialog(VerificationDialog());
                    },
                    frontImage: ImagePath.faceScan,
                    frontImageHeight: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
