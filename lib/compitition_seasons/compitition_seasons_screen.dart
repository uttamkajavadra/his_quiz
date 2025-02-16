import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/compitition_seasons/components/card_widget.dart';
import 'package:his_quiz/compitition_seasons/components/international_card_widget.dart';
import 'package:his_quiz/compitition_seasons/tab_bar_items/live_tab_screen.dart';
import 'package:his_quiz/compitition_seasons/tab_bar_items/past_tab_screen.dart';
import 'package:his_quiz/compitition_seasons/tab_bar_items/upcoming_tab_screen.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/globals.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';
import 'package:his_quiz/widgets/common_button.dart';
import 'package:his_quiz/widgets/loading_dialog.dart';
import 'package:intl/intl.dart';

class CompititionSeasonsScreen extends StatefulWidget {
  const CompititionSeasonsScreen({super.key});

  @override
  State<CompititionSeasonsScreen> createState() =>
      _CompititionSeasonsScreenState();
}

class _CompititionSeasonsScreenState extends State<CompititionSeasonsScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController hostSchoolDateController = TextEditingController();
  String? selectedCountry;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);

    // Listener to update Global.competitionStatus
    tabController!.addListener(() {
      if (tabController!.indexIsChanging) {
        switch (tabController!.index) {
          case 0:
            Global.competitionStatus = "live";
            break;
          case 1:
            Global.competitionStatus = "upcoming";
            break;
          case 2:
            Global.competitionStatus = "past";
            break;
        }
      }
    });
  }

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      // firstDate: DateTime(2000),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  InputDecoration bottomInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        color: CommonColors.hintTextColor,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: CommonColors.textFieldColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: CommonColors.textFieldColor,
        ),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: CommonColors.primary,
        ),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: CommonColors.redAccent,
        ),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      filled: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 14,
      ),
    );
  }

  Widget bottomDatePickerField(
    BuildContext context,
    String label,
    TextEditingController controller,
    final String? Function(String?)? validator,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: controller,
          readOnly: true,
          validator: validator,
          decoration: bottomInputDecoration("Select Date").copyWith(
            suffixIcon: InkWell(
              child: const Icon(
                Icons.calendar_month_outlined,
                size: 20,
              ),
              onTap: () => selectDate(
                context,
                controller,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTextField(
    BuildContext context,
    String label,
    TextEditingController controller,
    final String? Function(String?)? validator,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: controller,
          readOnly: false,
          validator: validator,
          // decoration: InputDecoration(
          //   hintText: hintText,
          //   border: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(8),
          //   ),
          //   contentPadding: const EdgeInsets.symmetric(
          //     vertical: 10,
          //     horizontal: 15,
          //   ),
          // ),
          decoration: bottomInputDecoration("Enter Host School"),
        ),
      ],
    );
  }

  showAddSeasonSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Add New Season",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 22,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: bottomDatePickerField(
                        context,
                        "Start Date",
                        startDateController,
                        (value) {
                          if (value == null || value.isEmpty) {
                            return "Start Date is required";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: bottomDatePickerField(
                        context,
                        "End Date",
                        endDateController,
                        // (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return "End Date is required";
                        //   }
                        //   DateTime? startDate = DateTime.tryParse(
                        //     startDateController.text,
                        //   );
                        //   DateTime? endDate = DateTime.tryParse(value);
                        //   if (startDate != null && endDate != null) {
                        //     if (endDate.isBefore(startDate) ||
                        //         endDate.isAtSameMomentAs(startDate)) {
                        //       return "End Date must be after Start Date";
                        //     }
                        //   }
                        //   return null;
                        // },
                        (value) {
                          if (value == null || value.isEmpty) {
                            return "End Date is required";
                          }
                          try {
                            DateTime startDate = DateFormat('yyyy-MM-dd').parse(
                              startDateController.text,
                            );
                            DateTime endDate =
                                DateFormat('yyyy-MM-dd').parse(value);
                            if (endDate.isBefore(startDate) ||
                                endDate.isAtSameMomentAs(startDate)) {
                              return "End Date must be after Start Date";
                            }
                          } catch (e) {
                            return "Invalid date format";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Select Country",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    DropdownButtonFormField<String>(
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 22,
                      ),
                      value: selectedCountry,
                      items: ["USA", "India", "UK", "Canada"]
                          .map((String country) {
                        return DropdownMenuItem<String>(
                          value: country,
                          child: Text(
                            country,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        selectedCountry = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please select a country";
                        }
                        return null;
                      },
                      decoration: bottomInputDecoration(
                        "Select Country",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                bottomTextField(
                  context,
                  "Enter Host School",
                  hostSchoolDateController,
                  (value) {
                    if (value == null || value.isEmpty) {
                      return "Host School is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonButton(
                  child: Text(
                    "Create",
                    style: CommonTextStyle.bold.copyWith(
                      fontSize: 16,
                      color: CommonColors.whiteColor,
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Show Loading Dialog
                      showLoadingDialog();

                      Timer(
                        const Duration(
                          seconds: 2,
                        ),
                        () {
                          // Hide Loading Dialog
                          hideLoadingDialog();

                          // Redirect
                          Get.back();
                        },
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
          // Expanded(
          //   child: SingleChildScrollView(
          //     physics: const BouncingScrollPhysics(
          //       parent: AlwaysScrollableScrollPhysics(),
          //     ),
          //     child: Column(
          //       children: [
          //         const SizedBox(
          //           height: 20,
          //         ),
          //         Container(
          //           decoration: BoxDecoration(
          //             color: Colors.orange.shade50,
          //             border: Border.all(
          //               color: CommonColors.primary,
          //             ),
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           margin: const EdgeInsets.symmetric(
          //             horizontal: 20,
          //             vertical: 10,
          //           ),
          //           child: TabBar(
          //             controller: tabController,
          //             indicator: BoxDecoration(
          //               color: CommonColors.primary,
          //               borderRadius: BorderRadius.circular(10),
          //             ),
          //             indicatorColor: CommonColors.transparentColor,
          //             indicatorSize: TabBarIndicatorSize.tab,
          //             labelColor: Colors.white,
          //             dividerColor: CommonColors.transparentColor,
          //             unselectedLabelColor: Colors.orange,
          //             labelStyle: const TextStyle(
          //               fontSize: 16,
          //               fontWeight: FontWeight.bold,
          //             ),
          //             unselectedLabelStyle: const TextStyle(
          //               fontSize: 16,
          //               fontWeight: FontWeight.normal,
          //             ),
          //             tabs: const [
          //               Tab(
          //                 text: "Live",
          //               ),
          //               Tab(
          //                 text: "Upcoming",
          //               ),
          //               Tab(
          //                 text: "Past",
          //               ),
          //             ],
          //           ),
          //         ),
          //         SizedBox(
          //           height: MediaQuery.of(context).size.height - 200,
          //           child: TabBarView(
          //             controller: tabController,
          //             children: const [
          //               LiveTabScreen(),
          //               UpcomingTabScreen(),
          //               PastTabScreen(),
          //             ],
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(
          //             horizontal: 20.0,
          //           ),
          //           child: CommonButton(
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: [
          //                 const Icon(
          //                   Icons.add,
          //                   size: 20,
          //                   color: CommonColors.whiteColor,
          //                 ),
          //                 Text(
          //                   "Add Season",
          //                   style: CommonTextStyle.bold.copyWith(
          //                     fontSize: 16,
          //                     color: CommonColors.whiteColor,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             onPressed: () {},
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 20,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          if (Global.role == "admin")
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
                    text: "Live",
                  ),
                  Tab(
                    text: "Upcoming",
                  ),
                  Tab(
                    text: "Past",
                  ),
                ],
              ),
            ),
          if (Global.role == "admin")
            Expanded(
              // Use Expanded to allow TabBarView to take available space
              child: TabBarView(
                controller: tabController,
                children: const [
                  LiveTabScreen(),
                  UpcomingTabScreen(),
                  PastTabScreen(),
                ],
              ),
            ),

          if (Global.role == "host")
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
                        return CardWidget(
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
                            return InternationalCardWidget(
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

          if (Global.role == "admin")
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CommonButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.add,
                        size: 20, color: CommonColors.whiteColor),
                    Text(
                      "Add Season",
                      style: CommonTextStyle.bold.copyWith(
                          fontSize: 16, color: CommonColors.whiteColor),
                    ),
                  ],
                ),
                onPressed: () {
                  showAddSeasonSheet();
                },
              ),
            ),
          const SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: commonBottomBar(),
    );
  }
}
