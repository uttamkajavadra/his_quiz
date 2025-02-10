import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/common_colors.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/admin/students_screen/selected_student/selected_student_screen.dart';
import 'package:his_quiz/admin/students_screen/student_list/student_list_screen.dart';
import 'package:his_quiz/widgets/common_button.dart';

class VerifyFaceDialog extends StatefulWidget {
  const VerifyFaceDialog({super.key});

  @override
  State<VerifyFaceDialog> createState() => VerifyFaceDialogState();
}

class VerifyFaceDialogState extends State<VerifyFaceDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  bool visible = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    )..repeat(
        reverse: true,
      );

    animation = Tween<double>(
      begin: 1,
      end: 1.4,
    ).animate(controller);

    Timer(
        const Duration(
          milliseconds: 300,
        ), () {
      setState(() {
        visible = true;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: CommonColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      // Outer Glow Circle
                      AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 600,
                        ),
                        width: 100 * animation.value,
                        height: 100 * animation.value,
                        decoration: BoxDecoration(
                          color: CommonColors.primary.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                      ),

                      // Middle Circle
                      AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 400,
                        ),
                        width: 80 * animation.value,
                        height: 80 * animation.value,
                        decoration: BoxDecoration(
                          color: CommonColors.primary.withOpacity(0.4),
                          shape: BoxShape.circle,
                        ),
                      ),

                      // Inner Circle
                      AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: CommonColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),

                      // Checkmark Icon
                      AnimatedOpacity(
                        opacity: visible ? 1.0 : 0.0,
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        child: SvgPicture.asset(
                          ImagePath.doneIcon,
                          height: 30,
                          width: 30,
                          colorFilter: const ColorFilter.mode(
                            CommonColors.whiteColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        // child: const Icon(
                        //   Icons.check,
                        //   color: CommonColors.whiteColor,
                        //   size: 30,
                        // ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const Text(
              'Student Added in Quiz',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF21201D),
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 1.40,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CommonDialogButton(
                      onTap: () {
                        Get.back();
                        Get.back();
                        Get.off(
                          const SelectedStudentScreen(),
                        );
                      },
                      leftButton: true,
                      title: "Go to quiz",
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: CommonDialogButton(
                      onTap: () {
                        Get.back();
                        Get.back();
                        Get.back();
                        Get.off(
                          const StudentListScreen(),
                        );
                      },
                      leftButton: false,
                      title: 'Student List',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerificationFaliedStudentDialog extends StatefulWidget {
  const VerificationFaliedStudentDialog({super.key});

  @override
  State<VerificationFaliedStudentDialog> createState() =>
      _VerificationFaliedStudentDialogState();
}

class _VerificationFaliedStudentDialogState
    extends State<VerificationFaliedStudentDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  bool visible = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    )..repeat(
        reverse: true,
      );

    animation = Tween<double>(
      begin: 1,
      end: 1.4,
    ).animate(controller);

    Timer(
        const Duration(
          milliseconds: 300,
        ), () {
      setState(() {
        visible = true;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: CommonColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      // Outer Glow Circle
                      AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 600,
                        ),
                        width: 100 * animation.value,
                        height: 100 * animation.value,
                        decoration: BoxDecoration(
                          color: CommonColors.redAccent.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                      ),

                      // Middle Circle
                      AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 400,
                        ),
                        width: 80 * animation.value,
                        height: 80 * animation.value,
                        decoration: BoxDecoration(
                          color: CommonColors.redAccent.withOpacity(0.4),
                          shape: BoxShape.circle,
                        ),
                      ),

                      // Inner Circle
                      AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: CommonColors.redAccent,
                          shape: BoxShape.circle,
                        ),
                      ),

                      // Checkmark Icon
                      AnimatedOpacity(
                        opacity: visible ? 1.0 : 0.0,
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        child: SvgPicture.asset(
                          ImagePath.dangerCircleIcon,
                          height: 30,
                          width: 30,
                          colorFilter: const ColorFilter.mode(
                            CommonColors.whiteColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        // child: const Icon(
                        //   Icons.delete_outline_rounded,
                        //   color: CommonColors.whiteColor,
                        //   size: 30,
                        // ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const Text(
              'Student Verification Falied',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF21201D),
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 1.40,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CommonDialogButton(
                      onTap: () {},
                      leftButton: true,
                      title: "Try again",
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: CommonDialogButton(
                      onTap: () {},
                      leftButton: false,
                      title: 'Add Anyway',
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Remove this Student',
                style: TextStyle(
                  color: CommonColors.redAccent,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w500,
                  decorationColor: CommonColors.redAccent,
                  height: 1.57,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RemoveStudentDialog extends StatefulWidget {
  const RemoveStudentDialog({super.key});

  @override
  State<RemoveStudentDialog> createState() => _RemoveStudentDialogState();
}

class _RemoveStudentDialogState extends State<RemoveStudentDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  bool visible = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    )..repeat(
        reverse: true,
      );

    animation = Tween<double>(
      begin: 1,
      end: 1.4,
    ).animate(controller);

    Timer(
        const Duration(
          milliseconds: 300,
        ), () {
      setState(() {
        visible = true;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: CommonColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      // Outer Glow Circle
                      AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 600,
                        ),
                        width: 100 * animation.value,
                        height: 100 * animation.value,
                        decoration: BoxDecoration(
                          color: CommonColors.redAccent.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                      ),

                      // Middle Circle
                      AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 400,
                        ),
                        width: 80 * animation.value,
                        height: 80 * animation.value,
                        decoration: BoxDecoration(
                          color: CommonColors.redAccent.withOpacity(0.4),
                          shape: BoxShape.circle,
                        ),
                      ),

                      // Inner Circle
                      AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: CommonColors.redAccent,
                          shape: BoxShape.circle,
                        ),
                      ),

                      // Checkmark Icon
                      AnimatedOpacity(
                        opacity: visible ? 1.0 : 0.0,
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        child: SvgPicture.asset(
                          ImagePath.deleteIcon,
                          height: 30,
                          width: 30,
                          colorFilter: const ColorFilter.mode(
                            CommonColors.whiteColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        // child: const Icon(
                        //   Icons.delete_outline_rounded,
                        //   color: CommonColors.whiteColor,
                        //   size: 30,
                        // ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const Text(
              'Are you sure you want to delete this student',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF21201D),
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 1.40,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CommonDialogButton(
                      onTap: () {},
                      leftButton: true,
                      title: "No",
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: CommonDialogButton(
                      onTap: () {},
                      leftButton: false,
                      title: 'Yes',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DivideGroupDialog extends StatefulWidget {
  final int totalStudent;
  const DivideGroupDialog({
    super.key,
    required this.totalStudent,
  });

  @override
  State<DivideGroupDialog> createState() => _DivideGroupDialogState();
}

class _DivideGroupDialogState extends State<DivideGroupDialog> {
  final TextEditingController _groupController = TextEditingController();
  int totalStudents = 0;
  int totalGroups = 0;
  int studentsPerGroup = 0;

  TextEditingController divideGroupController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      totalStudents = widget.totalStudent;
    });
  }

  void calculateGroups() {
    setState(() {
      totalGroups = int.tryParse(_groupController.text) ?? 0;
      studentsPerGroup = (totalGroups > 0) ? (totalStudents ~/ totalGroups) : 0;
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
          readOnly: true,
          validator: validator,
          keyboardType: TextInputType.number,
          decoration: dialogInputDecoration(
            "Divide Group",
          ),
          onChanged: (value) => calculateGroups(),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Divide Group",
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

            // Input Field
            dialogTextField(
              context,
              "Divide Group",
              divideGroupController,
              (value) {
                if (value == null || value.isEmpty) {
                  return "Divide Group is required";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),

            // Display Group Calculations
            rowData(
              "Total Student",
              totalStudents.toString(),
            ),
            rowData(
              "Total group",
              totalGroups.toString(),
            ),
            rowData(
              "Total student in group",
              studentsPerGroup.toString(),
            ),
            const SizedBox(height: 20),

            // Action Buttons
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
                const SizedBox(width: 12),
                Expanded(
                  child: CommonDialogButton(
                    title: "Divide",
                    leftButton: false,
                    onTap: () {
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
