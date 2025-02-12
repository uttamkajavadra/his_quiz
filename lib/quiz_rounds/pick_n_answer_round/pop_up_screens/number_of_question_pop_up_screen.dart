import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/quiz_rounds/pick_n_answer_round/round_3_screen.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/widgets/common_button.dart';
import 'package:his_quiz/widgets/loading_dialog.dart';

class NumberOfQuestionPopUpScreen extends StatefulWidget {
  final bool isGroup;
  final int totalStudent;
  const NumberOfQuestionPopUpScreen({
    super.key,
    required this.isGroup,
    required this.totalStudent,
  });

  @override
  State<NumberOfQuestionPopUpScreen> createState() =>
      _NumberOfQuestionPopUpScreenState();
}

class _NumberOfQuestionPopUpScreenState
    extends State<NumberOfQuestionPopUpScreen> {
  int totalStudents = 0;
  int questionPerStudents = 0;
  int totalQuestion = 0;

  TextEditingController questionPerStudentController = TextEditingController();
  TextEditingController addTimeController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    setState(() {
      totalStudents = widget.totalStudent;
    });
  }

  // totalQuestion() {
  //   return int.parse(questionPerStudentController.text) * totalStudents;
  // }

  void countTotalQuestion() {
    setState(() {
      questionPerStudents =
          int.tryParse(questionPerStudentController.text) ?? 0;
      totalQuestion =
          (questionPerStudents > 0) ? (questionPerStudents * totalStudents) : 0;
    });
  }

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
          onChanged: (value) => countTotalQuestion(),
        ),
      ],
    );
  }

  Widget rowData(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
        ],
      ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Number Of Questions",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    dialogTextField(
                      context,
                      "Number of questions Per Student",
                      "Number of questions Per Student",
                      questionPerStudentController,
                      (value) {
                        if (value == null || value.isEmpty) {
                          return "Number of questions is required";
                        }
                        if (int.tryParse(value) == null) {
                          return "Please enter a valid integer";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                height: 8,
              ),
              const Divider(
                color: CommonColors.textFieldColor,
              ),
              const SizedBox(
                height: 8,
              ),
              rowData(
                "Total Student",
                totalStudents.toString(),
              ),
              rowData(
                "Questions Per Student",
                questionPerStudents.toString(),
              ),
              rowData(
                "Total Questions",
                totalQuestion.toString(),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: CommonDialogButton(
                      title: "Cancel",
                      leftButton: true,
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
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
                                Round3Screen(
                                  isGroupWiseRound: widget.isGroup,
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
