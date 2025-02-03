import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/config/app_colors.dart';
import 'package:his_quiz/view/student_screens/selected_student_screen.dart';
import 'package:his_quiz/view/student_screens/student_screen.dart';
import 'package:his_quiz/widget/app_button.dart';

class VerificationDialog extends StatefulWidget {
  const VerificationDialog({super.key});

  @override
  State<VerificationDialog> createState() => _VerificationDialogState();
}

class _VerificationDialogState extends State<VerificationDialog>    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1, end: 1.4).animate(_controller);

    Timer(Duration(milliseconds: 300), () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
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
           SizedBox(height: 150,

             child: AnimatedBuilder(
                     animation: _controller,
                     builder: (context, child) {
                       return Stack(
              alignment: Alignment.center,
              children: [
                // Outer Glow Circle
                AnimatedContainer(
                  duration: Duration(milliseconds: 600),
                  width: 100 * _animation.value,
                  height: 100 * _animation.value,
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                ),
             
                // Middle Circle
                AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  width: 80 * _animation.value,
                  height: 80 * _animation.value,
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
             
                // Inner Circle
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                ),
             
                // Checkmark Icon
                AnimatedOpacity(
                  opacity: _visible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: Icon(
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
            Text(
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
                         Expanded(child: 
                          commonButton(
                    title: "Go to quiz",
                    textColor: AppColors.textBlackColor,
                    borderColor: AppColors.primary,
                  backColor: AppColors.transparentColor,
                    // isExpand: true,
                    
                    onTap: () {
                      Get.back();
                      Get.back();
                      Get.off(()=>SelectedStudentScreen());
                      
                    },
                    
                    frontImageHeight: 20),),
                        const SizedBox(width: 16),
                        Expanded(child: 
                          commonButton(
                    title: "Student List",
                  
                    // isExpand: true,
                    onTap: () {
                      Get.back();
                      Get.back();
                      // Get.back();
                      // Get.off(()=>StudentListScreen());
                    },
                    
                    frontImageHeight: 20),),
                        // Expanded(
                        //     child: Container(
                        //         height: 48,
                        //         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        //         decoration: ShapeDecoration(
                        //             color: Color(0xFFFB923C),
                        //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        //         ),
                        //         child: Row(
                        //             mainAxisSize: MainAxisSize.min,
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             crossAxisAlignment: CrossAxisAlignment.center,
                        //             children: [
                        //                 Text(
                        //                     'Student List',
                        //                     textAlign: TextAlign.center,
                        //                     style: TextStyle(
                        //                         color: Colors.white,
                        //                         fontSize: 16,
                        //                         fontFamily: 'Inter',
                        //                         fontWeight: FontWeight.w500,
                        //                         height: 1.50,
                        //                     ),
                        //                 ),
                        //             ],
                        //         ),
                        //     ),
                        // ),
                    ],
                ),
            ),
        ],
    ),
),
    );
  }
}