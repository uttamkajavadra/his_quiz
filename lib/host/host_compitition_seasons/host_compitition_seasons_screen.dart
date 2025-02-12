import 'package:flutter/material.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/host/host_compitition_seasons/components/host_card_widget.dart';
import 'package:his_quiz/host/host_compitition_seasons/components/host_international_card_widget.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';

class HostCompititionSeasonsScreen extends StatefulWidget {
  const HostCompititionSeasonsScreen({super.key});

  @override
  State<HostCompititionSeasonsScreen> createState() =>
      _HostCompititionSeasonsScreenState();
}

class _HostCompititionSeasonsScreenState
    extends State<HostCompititionSeasonsScreen> {
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
                  // InkWell(
                  //   onTap: () {
                  //     Get.back();
                  //   },
                  //   child: const Icon(
                  //     Icons.arrow_back_ios_new_rounded,
                  //   ),
                  // ),
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
                children: [
                  ListView.builder(
                    itemCount: 5,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    itemBuilder: (context, index) {
                      return HostCardWidget(
                        index: index,
                      );
                    },
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          decoration: const BoxDecoration(
                            color: CommonColors.primary,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "International",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ListView.builder(
                        itemCount: 1,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          // vertical: 16,
                        ),
                        itemBuilder: (context, index) {
                          return HostInternationalCardWidget(
                            index: index,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
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
