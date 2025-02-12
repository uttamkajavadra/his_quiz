import 'package:flutter/material.dart';
import 'package:his_quiz/students_screen/student_list/components/card_widget_student_list.dart';

class FailedTabScreen extends StatefulWidget {
  const FailedTabScreen({super.key});

  @override
  State<FailedTabScreen> createState() => _FailedTabScreenState();
}

class _FailedTabScreenState extends State<FailedTabScreen> {
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
