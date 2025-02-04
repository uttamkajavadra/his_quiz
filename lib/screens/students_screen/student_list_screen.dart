import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/screens/students_screen/components/card_widget_student_list.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';
import 'package:his_quiz/widgets/common_text_field.dart';

class StudentListScreen extends StatefulWidget {
  final bool isSelectedStudentScreen;

  const StudentListScreen({
    super.key,
    this.isSelectedStudentScreen = false,
  });

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  String sortingValue = "Name A to Z";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: commonBottomBar(),
      body: Column(
        children: [
          // commonAppBar(title: "Student List"),
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
                      "Student List",
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
                    child: CommonTextField(
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
                      children: [
                        Text(
                          "100 Students",
                          textAlign: TextAlign.left,
                          style: CommonTextStyle.regular700.copyWith(
                            fontSize: 16,
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      sortingValue,
                                      style:
                                          CommonTextStyle.regular400.copyWith(
                                        fontSize: 14,
                                        color: CommonColors.textBlackColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                    ),
                                  ],
                                ),
                              ),
                              // child: Row(
                              //   mainAxisSize: MainAxisSize.min,
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   children: [
                              //     Text(
                              //       sortingValue,
                              //       style: CommonTextStyle.regular400.copyWith(
                              //         fontSize: 14,
                              //         color: CommonColors.textBlackColor,
                              //       ),
                              //     ),
                              //     const SizedBox(
                              //       width: 6,
                              //     ),
                              //     PopupMenuButton<String>(
                              //       onSelected: (value) {
                              //         setState(() {
                              //           sortingValue = value;
                              //         });
                              //       },
                              //       itemBuilder: (context) => [
                              //         const PopupMenuItem(
                              //           // value: 'A-Z',
                              //           value: 'Name A to Z',
                              //           child: Text(
                              //             'Name A to Z',
                              //           ),
                              //         ),
                              //         const PopupMenuItem(
                              //           // value: 'Z-A',
                              //           value: 'Name Z to A',
                              //           child: Text(
                              //             'Name Z to A',
                              //           ),
                              //         ),
                              //       ],
                              //       child: const Icon(
                              //         Icons.keyboard_arrow_down_rounded,
                              //       ),
                              //     ),
                              //   ],
                              // ),
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
                      return const CardWidgetStudentList();
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
