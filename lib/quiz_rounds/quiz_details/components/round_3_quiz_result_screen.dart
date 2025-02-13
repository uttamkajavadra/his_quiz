import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/controllers/quiz_controller.dart';

class Round3QuizResultScreen extends StatefulWidget {
  final QuizController controller;
  const Round3QuizResultScreen({
    super.key,
    required this.controller,
  });

  @override
  State<Round3QuizResultScreen> createState() => _Round3QuizResultScreenState();
}

class _Round3QuizResultScreenState extends State<Round3QuizResultScreen> {
  int? selectedAnswerIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.orange.shade50,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SvgPicture.asset(
                  ImagePath.round3Icon,
                  height: 32,
                  width: 32,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "Pick 'N' Answer Round",
                  style: CommonTextStyle.regular500.copyWith(
                    fontSize: 16,
                    color: CommonColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.orange.shade50,
          ),
          Obx(
            () => ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.controller.round3Questions.length,
              itemBuilder: (context, index) {
                final question = widget.controller.round3Questions[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question.questionText,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: CommonColors.textBlackColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: question.options.length,
                      itemBuilder: (context, index) {
                        selectedAnswerIndex = question.selectedOption;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedAnswerIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              bottom: 8,
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 24,
                            ),
                            decoration: BoxDecoration(
                              color: selectedAnswerIndex == index
                                  ? CommonColors.greenColor.withOpacity(0.1)
                                  : CommonColors.whiteColor,
                              border: Border.all(
                                color: selectedAnswerIndex == index
                                    ? CommonColors.greenColor
                                    : Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                question.options[index],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: selectedAnswerIndex == index
                                      ? CommonColors.greenColor
                                      : CommonColors.blackColor,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const Center(
                      child: Text(
                        "answer in 15 second",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: CommonColors.primary,
                        ),
                      ),
                    ),
                    // if (index != widget.controller.round3Questions.length - 1)
                    //   const SizedBox(
                    //     height: 10,
                    //   ),
                    if (index != widget.controller.round3Questions.length - 1)
                      Divider(
                        color: Colors.orange.shade50,
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
