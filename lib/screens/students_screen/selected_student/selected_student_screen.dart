import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/screens/students_screen/selected_student/components/selected_student_card_widget.dart';
import 'package:his_quiz/screens/students_screen/student_list/student_list_screen.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';
import 'package:his_quiz/widgets/common_text_field.dart';

class SelectedStudentScreen extends StatefulWidget {
  const SelectedStudentScreen({super.key});

  @override
  State<SelectedStudentScreen> createState() => _SelectedStudentScreenState();
}

class _SelectedStudentScreenState extends State<SelectedStudentScreen> {
  String sortingValue = "Name A to Z";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: commonBottomBar(),
      body: Column(
        children: [
          // commonAppBar(title: "Selacted Student List"),
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
                      "Selacted Student List",
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
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 24,
                      right: 24,
                    ),
                    child: CommonSearchField(
                      hintText: "Search Students",
                      icon: Icons.search,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "100 Students",
                          textAlign: TextAlign.left,
                          style: CommonTextStyle.regular700.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                  const StudentListScreen(
                                    isSelectedStudentScreen: true,
                                  ),
                                );
                              },
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.person_add_alt_1_outlined,
                                    color: CommonColors.primary,
                                    size: 20,
                                  ),
                                  // Icon(
                                  //   Icons.add,
                                  //   color: CommonColors.primary,
                                  //   size: 20,
                                  // ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    'Add Student',
                                    style: TextStyle(
                                      color: Color(0xFFFB923C),
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      decorationColor: CommonColors.primary,
                                      height: 1.57,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Sort by :',
                                  style: CommonTextStyle.regular400.copyWith(
                                    fontSize: 12,
                                    color: CommonColors.hintTextColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: PopupMenuButton<String>(
                                    onSelected: (value) {
                                      setState(() {
                                        sortingValue = value;
                                      });
                                    },
                                    itemBuilder: (context) => [
                                      const PopupMenuItem(
                                        // value: 'A-Z',
                                        value: 'Name A to Z',
                                        child: Text(
                                          'Name A to Z',
                                        ),
                                      ),
                                      const PopupMenuItem(
                                        // value: 'Z-A',
                                        value: 'Name Z to A',
                                        child: Text(
                                          'Name Z to A',
                                        ),
                                      ),
                                    ],
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          sortingValue,
                                          style: CommonTextStyle.regular400
                                              .copyWith(
                                            fontSize: 14,
                                            color: CommonColors.textBlackColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        SvgPicture.asset(
                                          ImagePath.dropDownIcon,
                                          height: 30,
                                          width: 30,
                                          colorFilter: const ColorFilter.mode(
                                            CommonColors.blackColor,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                    itemCount: 15,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    itemBuilder: (context, index) {
                      return SelectedStudentCardWidget(
                        index: index,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
