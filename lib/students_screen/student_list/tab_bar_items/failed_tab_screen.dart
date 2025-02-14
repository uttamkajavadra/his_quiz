import 'package:flutter/material.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/models/students_data.dart';
import 'package:his_quiz/students_screen/student_list/components/card_widget_student_list.dart';

class FailedTabScreen extends StatefulWidget {
  const FailedTabScreen({super.key});

  @override
  State<FailedTabScreen> createState() => _FailedTabScreenState();
}

class _FailedTabScreenState extends State<FailedTabScreen> {
  List<StudentsData> studentsList = [
    StudentsData(
      image: ImagePath.studentImage,
      name: "Giovani Romaguera",
      schoolName: "Delhi Public School",
      address: "28 Headlands Kettering, Headlands, Kettering",
      state: "Wales",
      country: "United Kingdom",
      isWinner: false,
    ),
    StudentsData(
      image: ImagePath.studentImage,
      name: "Giovani Romaguera",
      schoolName: "Delhi Public School",
      address: "28 Headlands Kettering, Headlands, Kettering",
      state: "Wales",
      country: "United Kingdom",
      isWinner: false,
    ),
    StudentsData(
      image: ImagePath.studentImage,
      name: "Giovani Romaguera",
      schoolName: "Delhi Public School",
      address: "28 Headlands Kettering, Headlands, Kettering",
      state: "Wales",
      country: "United Kingdom",
      isWinner: false,
    ),
    StudentsData(
      image: ImagePath.studentImage,
      name: "Giovani Romaguera",
      schoolName: "Delhi Public School",
      address: "28 Headlands Kettering, Headlands, Kettering",
      state: "Wales",
      country: "United Kingdom",
      isWinner: false,
    ),
    StudentsData(
      image: ImagePath.studentImage,
      name: "Giovani Romaguera",
      schoolName: "Delhi Public School",
      address: "28 Headlands Kettering, Headlands, Kettering",
      state: "Wales",
      country: "United Kingdom",
      isWinner: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: studentsList.length,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            itemBuilder: (context, index) {
              return CardWidgetStudentList(
                index: index,
                studentsData: studentsList[index],
                isRemovedStudent: true,
                // isSelectedStudentScreen: true,
              );
            },
          ),
        ),
      ],
    );
  }
}
