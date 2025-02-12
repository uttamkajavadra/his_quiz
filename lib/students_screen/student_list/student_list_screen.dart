import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/globals.dart';
import 'package:his_quiz/students_screen/student_list/tab_bar_items/failed_tab_screen.dart';
import 'package:his_quiz/students_screen/student_list/tab_bar_items/to_be_verify_tab_screen.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
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

class _StudentListScreenState extends State<StudentListScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

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
          Column(
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
                  children: [
                    Text(
                      "450 Students",
                      textAlign: TextAlign.left,
                      style: CommonTextStyle.regular700.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.to(
                        //   const StudentListScreen(
                        //     isSelectedStudentScreen: true,
                        //   ),
                        // );
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: CommonColors.primary,
                            size: 20,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Add Student',
                            style: TextStyle(
                              color: Color(0xFFFB923C),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                              decorationColor: CommonColors.primary,
                              height: 1.57,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              border: Border.all(
                color: CommonColors.primary,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TabBar(
              controller: tabController,
              indicator: BoxDecoration(
                color: CommonColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              indicatorColor: CommonColors.transparentColor,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              dividerColor: CommonColors.transparentColor,
              unselectedLabelColor: Colors.orange,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              tabs: [
                Tab(
                  text: Global.competitionStatus == "past"
                      ? "Quiz Student"
                      : "To be verify",
                ),
                Tab(
                  text: Global.competitionStatus == "past"
                      ? "Removed Student"
                      : "Failed",
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                ToBeVerifyTabScreen(),
                FailedTabScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
