import 'package:flutter/material.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';

class TitleSubTitle extends StatefulWidget {
  final String title;
  final String subTitle;

  const TitleSubTitle({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  State<TitleSubTitle> createState() => _TitleSubTitleState();
}

class _TitleSubTitleState extends State<TitleSubTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: CommonTextStyle.regular600.copyWith(
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: SizedBox(
              child: Text(
                widget.subTitle,
                textAlign: TextAlign.right,
                style: CommonTextStyle.regular600.copyWith(
                  fontSize: 14,
                  color: CommonColors.gretTextTextColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
