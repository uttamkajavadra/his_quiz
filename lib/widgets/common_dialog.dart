import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/screens/students_screen/selected_student/selected_student_screen.dart';
import 'package:his_quiz/screens/students_screen/student_list/student_list_screen.dart';
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
          color: Colors.white,
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
                          color: Colors.orange.withOpacity(0.2),
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
                          color: Colors.orange.withOpacity(0.4),
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
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                      ),

                      // Checkmark Icon
                      AnimatedOpacity(
                        opacity: visible ? 1.0 : 0.0,
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 30,
                        ),
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
          color: Colors.white,
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
                          color: Colors.red.withOpacity(0.2),
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
                          color: Colors.red.withOpacity(0.4),
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
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),

                      // Checkmark Icon
                      AnimatedOpacity(
                        opacity: visible ? 1.0 : 0.0,
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        child: const Icon(
                          Icons.delete_outline_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
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
