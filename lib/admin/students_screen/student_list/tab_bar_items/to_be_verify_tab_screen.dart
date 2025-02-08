import 'package:flutter/material.dart';
import 'package:his_quiz/admin/students_screen/student_list/components/card_widget_student_list.dart';

class ToBeVerifyTabScreen extends StatefulWidget {
  const ToBeVerifyTabScreen({super.key});

  @override
  State<ToBeVerifyTabScreen> createState() => _ToBeVerifyTabScreenState();
}

class _ToBeVerifyTabScreenState extends State<ToBeVerifyTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            itemBuilder: (context, index) {
              return CardWidgetStudentList(
                index: index,
                // isSelectedStudentScreen: true,
              );
            },
          ),
        ),
      ],
    );
  }
}
