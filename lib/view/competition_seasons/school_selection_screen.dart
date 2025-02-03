import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/app_colors.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/config/text_style.dart';
import 'package:his_quiz/view/student_screens/student_screen.dart';
import 'package:his_quiz/widget/common_appbar.dart';

class SchoolSelectionScreen extends StatefulWidget {
  final String? season;
  const SchoolSelectionScreen({super.key, this.season});

  @override
  State<SchoolSelectionScreen> createState() => _SchoolSelectionScreenState();
}

class _SchoolSelectionScreenState extends State<SchoolSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(      bottomNavigationBar:commonBottomBar(),

      body: Column(
        children: [
          commonAppBar(title: "${widget.season}"),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(
                      "Select State",
                      textAlign: TextAlign.left,
                      style: AppTextStyle.regular700.copyWith(fontSize: 16),
                    ),
                  ),
                  ListView.builder(
                    itemCount: 10,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    itemBuilder: (context, index) {
                      return cardWidget(index);
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

  cardWidget(index) {
    return GestureDetector(
      onTap: () {
        Get.to(()=>StudentListScreen());
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.borderColor)),
        margin: EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 8),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: Image.asset(
                ImagePath.stateImage,
                height: 64,
                width: 64,
              ),
            ),
            Expanded(
              child: Text(
                "State name",
                style: AppTextStyle.regular500.copyWith(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
