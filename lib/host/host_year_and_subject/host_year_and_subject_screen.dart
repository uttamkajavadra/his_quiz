import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/host/host_year_and_subject/components/card_widget_host_year_and_subject.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';

class HostYearAndSubjectScreen extends StatefulWidget {
  const HostYearAndSubjectScreen({super.key});

  @override
  State<HostYearAndSubjectScreen> createState() =>
      _HostYearAndSubjectScreenState();
}

class _HostYearAndSubjectScreenState extends State<HostYearAndSubjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: commonBottomBar(),
      body: Column(
        children: [
          // commonAppBar(title: "${widget.season}"),
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
                      "Year and Subject",
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    itemCount: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    itemBuilder: (context, index) {
                      return CardWidgetHostYearAndSubject(
                        index: index,
                        subject: "Maths",
                        description: "Final Year Primary school Student",
                      );
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
