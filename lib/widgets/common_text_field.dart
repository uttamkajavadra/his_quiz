import 'package:flutter/material.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';

class CommonTextField extends StatefulWidget {
  final String hintText;
  final IconData icon;

  const CommonTextField({
    super.key,
    required this.hintText,
    required this.icon,
  });

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                textAlign: TextAlign.start,
                keyboardType: TextInputType.text,
                style: CommonTextStyle.regular500.copyWith(
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  fillColor: CommonColors.whiteColor,
                  contentPadding: const EdgeInsets.only(
                    top: 8,
                    bottom: 16,
                    right: 20,
                    left: 20,
                  ),
                  hintText: widget.hintText,
                  prefixIcon: Icon(
                    widget.icon,
                    size: 20,
                  ),
                  hintStyle: CommonTextStyle.regular400.copyWith(
                    color: CommonColors.hintTextColor,
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: CommonColors.textFieldColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
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
                      color: CommonColors.textFieldColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: CommonColors.textFieldColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
