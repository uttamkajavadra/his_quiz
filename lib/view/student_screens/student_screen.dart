import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/app_colors.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/config/text_style.dart';
import 'package:his_quiz/view/student_screens/selected_student_screen.dart';
import 'package:his_quiz/view/student_screens/studen_detail_screen.dart';
import 'package:his_quiz/widget/common_appbar.dart';
import 'package:his_quiz/widget/common_textfield.dart';

class StudentListScreen extends StatefulWidget {
  final bool isSelectedStudentScreen;
  const StudentListScreen({
    super.key,this.isSelectedStudentScreen=false,
  });

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: commonBottomBar(),
      body: Column(
        children: [
          commonAppBar(title: "Student List"),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              padding: EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CommonTextField(
                          hintText: "Search Students",
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24,right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "100 Students",
                          textAlign: TextAlign.left,
                          style: AppTextStyle.regular700.copyWith(fontSize: 16),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Sort by :',
                              style: AppTextStyle.regular400.copyWith(
                                  fontSize: 12, color: AppColors.hintTextColor),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Name A to Z',
                                      style: AppTextStyle.regular400.copyWith(
                                          fontSize: 14,
                                          color: AppColors.textBlackColor)),
                                  const SizedBox(width: 6),
                                  Icon(Icons.keyboard_arrow_down_rounded)
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                    itemCount: 15,
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
    return InkWell(
      onTap: () async {
        if(widget.isSelectedStudentScreen){
       await Get.off(()=>SelectedStudentScreen());
          
        }else{
       await Get.to(()=>StudenDetailScreen());

        }
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
                ImagePath.studentImage,
                height: 64,
                width: 64,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Giovani Romaguera",
                    style: AppTextStyle.regular500.copyWith(fontSize: 16),
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Image.asset(
                      ImagePath.homeIcon,
                      width: 22,
                      height: 22,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        "Delhi Public School",
                        style: AppTextStyle.regular400.copyWith(fontSize: 12),
                      ),
                    )
                  ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
