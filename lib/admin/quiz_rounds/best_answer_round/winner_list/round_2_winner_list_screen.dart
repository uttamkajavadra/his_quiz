import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/admin/quiz_rounds/best_answer_round/winner_list/tab_bar_items/failed_tab_screen_round_2.dart';
import 'package:his_quiz/admin/quiz_rounds/best_answer_round/winner_list/tab_bar_items/winner_tab_screen_round_2.dart';
import 'package:his_quiz/admin/quiz_rounds/pick_n_answer_round/pop_up_screens/number_of_question_pop_up_screen.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';
import 'package:his_quiz/widgets/common_button.dart';
import 'package:his_quiz/widgets/common_text_field.dart';

class Round2WinnerListScreen extends StatefulWidget {
  final int numbersOfFailedStudents;
  final int numbersOfPassedStudents;
  const Round2WinnerListScreen({
    super.key,
    required this.numbersOfFailedStudents,
    required this.numbersOfPassedStudents,
  });

  @override
  State<Round2WinnerListScreen> createState() => _Round2WinnerListScreenState();
}

class _Round2WinnerListScreenState extends State<Round2WinnerListScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  String sortingValue = 'Name A to Z';

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      "2nd Round Score",
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
                      "${widget.numbersOfPassedStudents} Students Attempted",
                      textAlign: TextAlign.left,
                      style: CommonTextStyle.regular700.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
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
                                value: 'Name A to Z',
                                child: Text(
                                  'Name A to Z',
                                ),
                              ),
                              const PopupMenuItem(
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
                                  style: CommonTextStyle.regular400.copyWith(
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
                        ),
                      ],
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
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            padding: const EdgeInsets.all(4),
            child: TabBar(
              controller: tabController,
              indicator: BoxDecoration(
                color: CommonColors.primary,
                borderRadius: BorderRadius.circular(4),
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
                  text: "${widget.numbersOfPassedStudents} Winner",
                ),
                Tab(
                  text: "${widget.numbersOfFailedStudents} Failed",
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                WinnerTabScreenRound2(
                  lengthOfList: widget.numbersOfPassedStudents,
                ),
                FailedTabScreenRound2(
                  lengthOfList: widget.numbersOfFailedStudents,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: CommonDialogButton(
                    title: "Divide Group",
                    leftButton: true,
                    onTap: () {
                      Get.dialog(
                        NumberOfQuestionPopUpScreen(
                          isGroup: true,
                          totalStudent: widget.numbersOfPassedStudents,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: CommonDialogButton(
                    title: "Start Round 3",
                    leftButton: false,
                    onTap: () {
                      Get.dialog(
                        NumberOfQuestionPopUpScreen(
                          isGroup: false,
                          totalStudent: widget.numbersOfPassedStudents,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
      bottomNavigationBar: commonBottomBar(),
    );
  }
}
