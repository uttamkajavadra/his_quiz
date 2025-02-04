import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';
import 'package:his_quiz/utils/validation/validator.dart';

class CommonTextField extends StatefulWidget {
  final String? title;
  final String? hintText;
  final String? validationMessage;
  // final String? suffixText;
  final bool? needValidation;
  final bool? isEmailValidation;
  final double? topPadding;
  final double? bottomPadding;
  final TextEditingController? controller;
  final bool? isPhoneValidation;
  final bool? isPasswordValidation;
  final TextInputType? textInputType;
  final int? maxLine;
  final int? maxLength;
  final double? borderRadius;
  final Widget? suffixIcon;
  final Color? borderColor;
  final Widget? prefixIcon;
  final TextAlign? textAlign;
  // final TextStyle? suffixStyle;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isTransparentColorBorder;
  final bool? isBigTitle;
  final bool? autofocus;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;
  final bool? obscureText;
  final Color? titleColor;
  final bool? readOnly;
  final Color? bgColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? titleMargin;

  const CommonTextField({
    super.key,
    this.title,
    this.hintText,
    this.validationMessage,
    this.needValidation,
    this.isEmailValidation,
    this.topPadding,
    this.bottomPadding,
    this.controller,
    this.isPhoneValidation,
    this.isPasswordValidation,
    this.textInputType,
    this.maxLine,
    this.maxLength,
    this.borderRadius,
    this.suffixIcon,
    this.borderColor,
    this.prefixIcon,
    this.textAlign,
    this.onTap,
    this.inputFormatters,
    this.isTransparentColorBorder,
    this.isBigTitle,
    this.autofocus,
    this.focusNode,
    this.validator,
    this.onChange,
    this.obscureText,
    this.titleColor,
    this.readOnly,
    this.bgColor,
    this.margin,
    this.contentPadding,
    this.titleMargin,
  });

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: widget.topPadding ?? 0),
        if (widget.title != null)
          Container(
            margin: widget.titleMargin,
            child: Text(
              '${widget.title}',
              style: widget.isBigTitle!
                  ? CommonTextStyle.regular600.copyWith(
                      fontSize: 17,
                      color: widget.titleColor,
                    )
                  : CommonTextStyle.regular600.copyWith(
                      fontSize: 16,
                      color: widget.titleColor,
                    ),
            ),
          ),
        if (widget.title != null) const SizedBox(height: 11),
        Container(
          margin: widget.margin,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(borderRadius ?? 10),
          //   boxShadow: [
          //     BoxShadow(
          //       offset: Offset(0, 0),
          //       blurRadius: 1,
          //       spreadRadius: 1,
          //       color: Colors.black.withOpacity(0.08),
          //     ),
          //   ],
          // ),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            maxLines: widget.maxLine,
            textAlign: widget.textAlign ?? TextAlign.start,
            onTap: widget.onTap,
            maxLength: widget.maxLength,
            controller: widget.controller,
            onChanged: widget.onChange,
            obscureText: widget.obscureText!,
            readOnly: widget.readOnly!,
            inputFormatters: widget.inputFormatters ?? [],
            focusNode: widget.focusNode,
            autofocus: widget.autofocus!,
            keyboardType: widget.textInputType ?? TextInputType.text,
            style: CommonTextStyle.regular500.copyWith(fontSize: 16),
            decoration: InputDecoration(
              fillColor: widget.bgColor ?? CommonColors.whiteColor,
              contentPadding: widget.contentPadding ??
                  const EdgeInsets.only(
                    top: 8,
                    bottom: 16,
                    right: 20,
                    left: 20,
                  ),
              isDense: true,
              filled: true,
              counterText: "",
              hintText: widget.hintText ?? "",

              suffixIcon: widget.suffixIcon,
              // suffixText: suffixText,
              // suffixStyle: suffixStyle,
              prefixIcon: widget.prefixIcon,
              hintStyle: CommonTextStyle.regular400.copyWith(
                color: widget.borderColor ?? CommonColors.hintTextColor,
                fontSize: 14,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.isTransparentColorBorder!
                      ? CommonColors.transparentColor
                      : (widget.borderColor ?? CommonColors.textFieldColor),
                ),
                borderRadius: BorderRadius.circular(
                  widget.borderRadius ?? 10,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.isTransparentColorBorder!
                      ? CommonColors.transparentColor
                      : (widget.borderColor ?? CommonColors.textFieldColor),
                ),
                borderRadius: BorderRadius.circular(
                  widget.borderRadius ?? 10,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.isTransparentColorBorder!
                      ? CommonColors.transparentColor
                      : (widget.borderColor ?? CommonColors.textFieldColor),
                ),
                borderRadius: BorderRadius.circular(
                  widget.borderRadius ?? 10,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.isTransparentColorBorder!
                      ? CommonColors.transparentColor
                      : (widget.borderColor ?? CommonColors.textFieldColor),
                ),
                borderRadius: BorderRadius.circular(
                  widget.borderRadius ?? 10,
                ),
              ),
            ),
            validator: widget.needValidation!
                ? widget.validator ??
                    (v) {
                      return TextFieldValidation.validation(
                        message: widget.validationMessage ?? widget.title,
                        value: v,
                        isPasswordValidator: widget.isPasswordValidation!,
                        isPhone: widget.isPhoneValidation!,
                        isEmailValidator: widget.isEmailValidation!,
                      );
                    }
                : null,
          ),
        ),
        SizedBox(height: widget.bottomPadding ?? 16),
      ],
    );
  }
}
