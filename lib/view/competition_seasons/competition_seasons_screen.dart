import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/app_colors.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/config/text_style.dart';
import 'package:his_quiz/view/competition_seasons/school_selection_screen.dart';
import 'package:his_quiz/widget/common_appbar.dart';

class CompetitionSeasons extends StatefulWidget {
  const CompetitionSeasons({super.key});

  @override
  State<CompetitionSeasons> createState() => _CompetitionSeasonsState();
}

class _CompetitionSeasonsState extends State<CompetitionSeasons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(      bottomNavigationBar:commonBottomBar(),

      body: Column(
        children: [
          commonAppBar(title: "Competition Seasons"),
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
        Get.to(()=>SchoolSelectionScreen(season: "Season ${index+1}",));
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
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 22),
              color: AppColors.primary,
              child: Text(
                "SEASON\n${index+1}",
                textAlign: TextAlign.center,
                style: AppTextStyle.regular500
                    .copyWith(fontSize: 16, color: AppColors.whiteColor),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  icontitleWidget(
                    ImagePath.calendarIcon,
                    "9th to 10th April",
                  ),
                  icontitleWidget(ImagePath.locationIcon, "United Kingdom",
                      padding: EdgeInsets.symmetric(vertical: 8)),
                  icontitleWidget(ImagePath.homeIcon, "Delta Careers College "),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  icontitleWidget(String imagePath, String title,
      {EdgeInsetsGeometry? padding}) {
    return Padding(
      padding: padding ?? EdgeInsets.all(0),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 22,
            height: 22,
          ),
          SizedBox(width: 4),
          Expanded(child: Text(title ,  style: AppTextStyle.regular500.copyWith(fontSize: 16),))
        ],
      ),
    );
  }
}
