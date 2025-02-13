import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/models/students_data.dart';

class QuizProfileCardScreen extends StatefulWidget {
  final StudentsData studentsData;
  const QuizProfileCardScreen({
    super.key,
    required this.studentsData,
  });

  @override
  State<QuizProfileCardScreen> createState() => _QuizProfileCardScreenState();
}

class _QuizProfileCardScreenState extends State<QuizProfileCardScreen> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.studentsData.image,
                  height: 58,
                  width: 58,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              // Name and School
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.studentsData.name,
                      style: CommonTextStyle.regular500.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImagePath.homeIcon,
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 3,
                          ),
                          child: Text(
                            widget.studentsData.schoolName,
                            style: CommonTextStyle.regular400.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.studentsData.address,
                      style: CommonTextStyle.regular400.copyWith(
                        fontSize: 12,
                        color: CommonColors.hintTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              // Trophy Icon
              if (widget.studentsData.isWinner)
                SvgPicture.asset(
                  ImagePath.trophyIcon,
                  height: 30,
                  width: 30,
                ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.orange.shade50,
          ),
          const SizedBox(
            height: 10,
          ),
          // State and Country
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'State',
                style: CommonTextStyle.regular500.copyWith(
                  fontSize: 14,
                  color: CommonColors.textBlackColor,
                ),
              ),
              Text(
                widget.studentsData.state,
                style: CommonTextStyle.regular500.copyWith(
                  fontSize: 14,
                  color: CommonColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Country',
                style: CommonTextStyle.regular500.copyWith(
                  fontSize: 14,
                  color: CommonColors.textBlackColor,
                ),
              ),
              Text(
                widget.studentsData.country,
                style: CommonTextStyle.regular500.copyWith(
                  fontSize: 14,
                  color: CommonColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
