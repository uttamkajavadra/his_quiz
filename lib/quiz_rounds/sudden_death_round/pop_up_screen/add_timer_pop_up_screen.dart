import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/quiz_rounds/sudden_death_round/round_4_screen.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/widgets/common_button.dart';
import 'package:his_quiz/widgets/loading_dialog.dart';

class AddTimerPopUpScreen extends StatefulWidget {
  final int totalStudent;
  const AddTimerPopUpScreen({
    super.key,
    required this.totalStudent,
  });

  @override
  State<AddTimerPopUpScreen> createState() => _AddTimerPopUpScreenState();
}

class _AddTimerPopUpScreenState extends State<AddTimerPopUpScreen> {
  TextEditingController addTimeController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  InputDecoration dialogInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        color: CommonColors.hintTextColor,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: CommonColors.textFieldColor,
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
      filled: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 14,
      ),
    );
  }

  Widget dialogTextField(
    BuildContext context,
    String label,
    String hint,
    TextEditingController controller,
    final String? Function(String?)? validator,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: controller,
          // readOnly: true,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.number,
          decoration: dialogInputDecoration(
            hint,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Add Timer",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    dialogTextField(
                      context,
                      "Add time in second",
                      "Add time in second",
                      addTimeController,
                      (value) {
                        if (value == null || value.isEmpty) {
                          return "Add time is required";
                        }
                        if (int.tryParse(value) == null) {
                          return "Please enter a valid integer";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: CommonDialogButton(
                      title: "Done",
                      leftButton: false,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          // Show Loading Dialog
                          showLoadingDialog();

                          Timer(
                            const Duration(
                              seconds: 2,
                            ),
                            () {
                              // Hide Loading Dialog
                              hideLoadingDialog();

                              // Redirect
                              Get.back();
                              Get.to(
                                Round4Screen(
                                  totalStudents: widget.totalStudent,
                                  questionTime: int.parse(
                                    addTimeController.text,
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
