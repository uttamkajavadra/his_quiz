import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/widgets/common_dialog.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';
import 'package:his_quiz/widgets/common_button.dart';

class FaceVerificationScreen extends StatefulWidget {
  const FaceVerificationScreen({super.key});

  @override
  State<FaceVerificationScreen> createState() => _FaceVerificationScreenState();
}

class _FaceVerificationScreenState extends State<FaceVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: commonBottomBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // commonAppBar(title: "Face Verification"),
            SafeArea(
              child: Container(
                height: 60,
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                // color: AppColors.blackColor,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Face Verification",
                        textAlign: TextAlign.center,
                        style: CommonTextStyle.regular600.copyWith(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              child: Column(
                children: [
                  DottedBorder(
                    color: CommonColors.primary,
                    strokeWidth: 2,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(15),
                    dashPattern: const [
                      15,
                      15,
                    ],
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
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
                          left: 6,
                          top: 7,
                          child: Container(
                            width: 310,
                            height: 191,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              gradient: LinearGradient(
                                begin: const Alignment(
                                  0.00,
                                  -1.00,
                                ),
                                end: const Alignment(
                                  0,
                                  1,
                                ),
                                colors: [
                                  const Color(0x00FB923C).withOpacity(0.4),
                                  const Color(0xFFFB923C).withOpacity(0.4),
                                ],
                              ),
                            ),
                            // child: Container(
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

                  // commonButton(
                  //     title: "Verify Face",
                  //     margin: EdgeInsets.only(top: Get.height*0.1,left: 12,right: 12),
                  //     isFront: true,
                  //     isExpand: true,
                  //     onTap: () async {
                  //     await  Get.dialog(VerificationDialog());
                  //     },
                  //     frontImage: ImagePath.faceScan,
                  //     frontImageHeight: 20,),

                  Container(
                    margin: EdgeInsets.only(
                      top: Get.height * 0.1,
                      left: 12,
                      right: 12,
                    ),
                    child: CommonButton(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImagePath.faceScan,
                            height: 20,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Flexible(
                            child: Text(
                              "Verify Face",
                              style: CommonTextStyle.bold.copyWith(
                                fontSize: 16,
                                color: CommonColors.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Get.dialog(
                          const VerifyFaceDialog(),
                          // const VerificationFaliedStudentDialog(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
