import 'package:flutter/material.dart';
import 'package:his_quiz/config/common_text_style.dart';

class HostIconTitleWidget extends StatefulWidget {
  final String imagePath;
  final String title;
  final EdgeInsetsGeometry? padding;

  const HostIconTitleWidget({
    super.key,
    required this.imagePath,
    required this.title,
    this.padding,
  });

  @override
  State<HostIconTitleWidget> createState() => _HostIconTitleWidgetState();
}

class _HostIconTitleWidgetState extends State<HostIconTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(0),
      child: Row(
        children: [
          Image.asset(
            widget.imagePath,
            width: 22,
            height: 22,
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
              child: Text(
            widget.title,
            style: CommonTextStyle.regular500.copyWith(
              fontSize: 16,
            ),
          ))
        ],
      ),
    );
  }
}
