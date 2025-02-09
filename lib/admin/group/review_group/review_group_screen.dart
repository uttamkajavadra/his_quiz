import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/admin/group/review_group/components/card_widget_review_group.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';

class ReviewGroupScreen extends StatefulWidget {
  final int groupCount;
  final int studentsPerGroup;
  final int totalGroups;
  const ReviewGroupScreen({
    super.key,
    required this.groupCount,
    required this.studentsPerGroup,
    required this.totalGroups,
  });

  @override
  State<ReviewGroupScreen> createState() => _ReviewGroupScreenState();
}

class _ReviewGroupScreenState extends State<ReviewGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // commonAppBar(
          //   title: "Competition Seasons",
          // ),
          SafeArea(
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
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Review Groups",
                      textAlign: TextAlign.center,
                      style: CommonTextStyle.regular600.copyWith(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  // Row(
                  //   children: actions ??
                  //       [
                  //         const SizedBox(
                  //           width: 24,
                  //         ),
                  //       ],
                  // ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: ListView.builder(
                itemCount: widget.groupCount,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                itemBuilder: (context, index) {
                  return CardWidgetReviewGroup(
                    index: index,
                    groupNumber: index + 1,
                    studentsPerGroup: widget.studentsPerGroup,
                    totalGroups: widget.totalGroups,
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: commonBottomBar(),
    );
  }
}
