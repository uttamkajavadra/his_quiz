import 'package:flutter/material.dart';
import 'package:his_quiz/config/image_path.dart';
import 'package:his_quiz/models/students_data.dart';
import 'package:his_quiz/students_screen/student_list/components/card_widget_student_list.dart';

class ToBeVerifyTabScreen extends StatefulWidget {
  const ToBeVerifyTabScreen({super.key});

  @override
  State<ToBeVerifyTabScreen> createState() => _ToBeVerifyTabScreenState();
}

class _ToBeVerifyTabScreenState extends State<ToBeVerifyTabScreen> {
  List<StudentsData> studentsList = [
    StudentsData(
      image: ImagePath.studentImage,
      name: "Giovani Romaguera",
      schoolName: "Delhi Public School",
      address: "28 Headlands Kettering, Headlands, Kettering",
      state: "Wales",
      country: "United Kingdom",
      isWinner: true,
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
                index: index, studentsData: studentsList[index],
                isRemovedStudent: false,
                // isSelectedStudentScreen: true,
              );
            },
          ),
        ),
      ],
    );
  }
}
