import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/globals.dart';
import 'package:his_quiz/levels/components/card_widget_select_country.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/levels/tab_bar_items/national_tab_screen.dart';
import 'package:his_quiz/levels/tab_bar_items/state_tab_screen.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({
    super.key,
  });

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen>
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
          // commonAppBar(title: "${widget.season}"),
          // SafeArea(
          //   child: Container(
          //     height: 60,
          //     padding: const EdgeInsets.only(
          //       left: 16,
          //       right: 16,
          //     ),
          //     // color: AppColors.blackColor,
          //     child: Row(
          //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         InkWell(
          //           onTap: () {
          //             Get.back();
          //           },
          //           child: const Icon(
          //             Icons.arrow_back_ios_new_rounded,
          //           ),
          //         ),
          //         Expanded(
          //           child: Text(
          //             Global.competitionStatus == "past"
          //                 ? "Levels"
          //                 : "Season 3",
          //             textAlign: TextAlign.center,
          //             style: CommonTextStyle.regular600.copyWith(
          //               fontSize: 20,
          //             ),
          //           ),
          //         ),
          //         // Row(
          //         //   children: actions ??
          //         //       [
          //         //         const SizedBox(
          //         //           width: 24,
          //         //         ),
          //         //       ],
          //         // ),
          //       ],
          //     ),
          //   ),
          // ),
          SafeArea(
            child: Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                children: [
                  // Back Button
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                      ),
                    ),
                  ),

                  // Centered Title
                  Center(
                    child: Text(
                      Global.competitionStatus == "past"
                          ? "Levels"
                          : "Season 3",
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
          if (Global.competitionStatus != "past")
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
                        return CardWidgetSelectCountry(
                          index: index,
                        );
                      },
                    )
                  ],
                ),
              ),
            ),

          if (Global.competitionStatus == "past")
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
              padding: const EdgeInsets.all(4),
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
                tabs: const [
                  Tab(
                    text: "State",
                  ),
                  Tab(
                    text: "National",
                  ),
                ],
              ),
            ),

          if (Global.competitionStatus == "past")
            Expanded(
              // Use Expanded to allow TabBarView to take available space
              child: TabBarView(
                controller: tabController,
                children: const [
                  StateTabScreen(),
                  NationalTabScreen(),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
