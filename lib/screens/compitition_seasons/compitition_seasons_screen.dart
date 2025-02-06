import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/screens/compitition_seasons/components/card_widget.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';

class CompititionSeasonsScreen extends StatefulWidget {
  const CompititionSeasonsScreen({super.key});

  @override
  State<CompititionSeasonsScreen> createState() =>
      _CompititionSeasonsScreenState();
}

class _CompititionSeasonsScreenState extends State<CompititionSeasonsScreen> {
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
                      "Competition Seasons",
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
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                    ),
                    child: Text(
                      "Select State",
                      textAlign: TextAlign.left,
                      style: CommonTextStyle.regular700.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    itemBuilder: (context, index) {
                      return CardWidget(
                        index: index,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: commonBottomBar(),
    );
  }
}
