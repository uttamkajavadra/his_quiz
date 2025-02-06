import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/config/image_path.dart';

class CommonAuthField extends StatefulWidget {
  final String titleText;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String?)? validator;

  const CommonAuthField({
    super.key,
    required this.titleText,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.validator,
  });

  @override
  State<CommonAuthField> createState() => _CommonAuthFieldState();
}

class _CommonAuthFieldState extends State<CommonAuthField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.titleText,
          style: CommonTextStyle.bold.copyWith(
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword ? _obscureText : false,
          validator: widget.validator,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: CommonTextStyle.regular500.copyWith(
              color: CommonColors.hintTextColor,
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
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    ),
                    color: CommonColors.textBlackColor,
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }
}

class CommonSearchField extends StatefulWidget {
  final String hintText;
  final IconData icon;

  const CommonSearchField({
    super.key,
    required this.hintText,
    required this.icon,
  });

  @override
  State<CommonSearchField> createState() => _CommonSearchFieldState();
}

class _CommonSearchFieldState extends State<CommonSearchField> {
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
                  prefixIcon: Container(
                    height: 30,
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      ImagePath.searchIcon,
                      height: 30,
                      width: 30,
                      colorFilter: const ColorFilter.mode(
                        CommonColors.blackColor,
                        BlendMode.srcIn,
                      ),
                    ),
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
