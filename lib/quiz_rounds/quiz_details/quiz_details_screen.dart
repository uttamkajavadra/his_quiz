import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/controllers/quiz_controller.dart';
import 'package:his_quiz/models/students_data.dart';
import 'package:his_quiz/quiz_rounds/quiz_details/components/quiz_profile_card_screen.dart';
import 'package:his_quiz/quiz_rounds/quiz_details/components/round_1_quiz_result_screen.dart';
import 'package:his_quiz/quiz_rounds/quiz_details/components/round_2_quiz_result_screen.dart';
import 'package:his_quiz/quiz_rounds/quiz_details/components/round_3_quiz_result_screen.dart';
import 'package:his_quiz/quiz_rounds/quiz_details/components/round_4_quiz_result_screen.dart';
import 'package:his_quiz/widgets/common_bottom_bar.dart';

class QuizDetailsScreen extends StatefulWidget {
  final StudentsData studentsData;

  const QuizDetailsScreen({
    super.key,
    required this.studentsData,
  });

  @override
  State<QuizDetailsScreen> createState() => _QuizDetailsScreenState();
}

class _QuizDetailsScreenState extends State<QuizDetailsScreen> {
  final QuizController controller = Get.put(QuizController());

  int? selectedAnswerIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: commonBottomBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        child: Column(
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
                        widget.studentsData.name,
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

            // Quiz Profile Card
            QuizProfileCardScreen(
              studentsData: widget.studentsData,
            ),

            // Round 1 Quiz Result
            Round1QuizResultScreen(
              controller: controller,
            ),

            // Round 2 Quiz Result
            Round2QuizResultScreen(
              controller: controller,
            ),

            // Round 3 Quiz Result
            Round3QuizResultScreen(
              controller: controller,
            ),

            // Round 4 Quiz Result
            Round4QuizResultScreen(
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}
