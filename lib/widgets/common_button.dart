import 'package:flutter/material.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/common_text_style.dart';

class CommonButton extends StatefulWidget {
  final Widget child;
  final void Function() onPressed;

  const CommonButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: CommonColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: widget.onPressed,
        child: widget.child,
      ),
    );
  }
}

class CommonDialogButton extends StatefulWidget {
  final void Function() onTap;
  final bool leftButton;
  final String title;

  const CommonDialogButton({
    super.key,
    required this.onTap,
    required this.leftButton,
    required this.title,
  });

  @override
  State<CommonDialogButton> createState() => _CommonDialogButtonState();
}

class _CommonDialogButtonState extends State<CommonDialogButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        // decoration: ShapeDecoration(
        //   color: CommonColors.whiteColor,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(8),
        //   ),
        // ),
        decoration: BoxDecoration(
          color: widget.leftButton ? Colors.white : const Color(0xFFFB923C),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: widget.leftButton
                ? const Color(0xFFFB923C)
                : CommonColors.whiteColor,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: CommonTextStyle.button.copyWith(
                color: widget.leftButton
                    ? CommonColors.blackColor
                    : CommonColors.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
