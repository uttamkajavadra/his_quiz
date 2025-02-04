import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/screens/students_screen/student_details/components/title_subtitle.dart';
import 'package:his_quiz/screens/students_screen/student_details/face_verification_screen.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';
import 'package:his_quiz/widgets/common_button.dart';

class StudentDetailsScreen extends StatefulWidget {
  const StudentDetailsScreen({super.key});

  @override
  State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: commonBottomBar(),
      body: Column(
        children: [
          // commonAppBar(title: "Jerome Bell"),
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
                      "Jerome Bell",
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
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                top: 12,
                left: 24,
                right: 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: Get.width * 0.3,
                    height: Get.width * 0.3,
                    margin: const EdgeInsets.only(
                      bottom: 24,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                          ImagePath.studentImage,
                        ),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleSubTitle(
                        title: "Sutdent Name",
                        subTitle: "Sigmund Legros",
                      ),
                      const TitleSubTitle(
                        title: "School Address",
                        subTitle: "OPENING MINDS, OPENING DOORS",
                      ),
                      const TitleSubTitle(
                        title: "City",
                        subTitle: "28 Headlands Kettering",
                      ),
                      const TitleSubTitle(
                        title: "Email",
                        subTitle: " Headlands, Kettering",
                      ),
                      const TitleSubTitle(
                        title: "State",
                        subTitle: "sigmundlegros@gmail.com",
                      ),
                      const SizedBox(
                        height: 24,
                      ),
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
                                Text(
                                  'State',
                                  style: CommonTextStyle.regular600.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  width: 150,
                                  height: 150,
                                  alignment: Alignment.center,
                                  decoration: ShapeDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        ImagePath.walesCity,
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Center(
                                  child: Text(
                                    'Wales',
                                    textAlign: TextAlign.center,
                                    style: CommonTextStyle.regular600.copyWith(
                                      fontSize: 16,
                                      color: CommonColors.gretTextTextColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Country',
                                  style: CommonTextStyle.regular600.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  width: 150,
                                  height: 150,
                                  decoration: ShapeDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        ImagePath.unitedKingdom,
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Center(
                                  child: Text(
                                    'United Kingdom',
                                    textAlign: TextAlign.center,
                                    style: CommonTextStyle.regular600.copyWith(
                                      fontSize: 16,
                                      color: CommonColors.gretTextTextColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // commonButton(
                      //     title: "Verify Face",
                      //     margin: EdgeInsets.only(top: 48),
                      //     isFront: true,
                      //     isExpand: true,
                      //     onTap: () async {
                      //     await  Get.off(()=>FaceVerificatopnScreen());
                      //     },
                      //     frontImage: ImagePath.faceScan,
                      //     frontImageHeight: 20),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 48,
                          bottom: 48,
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
                            Get.to(
                              const FaceVerificationScreen(),
                            );
                          },
                        ),
                      ),
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
}
