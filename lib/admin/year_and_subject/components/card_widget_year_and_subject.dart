import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:his_quiz/admin/levels/levels_screen.dart';

class CardWidgetYeasrAndSubject extends StatefulWidget {
  final int index;
  final String subject;
  final String description;

  const CardWidgetYeasrAndSubject({
    super.key,
    required this.index,
    required this.subject,
    required this.description,
  });

  @override
  State<CardWidgetYeasrAndSubject> createState() =>
      _CardWidgetYeasrAndSubjectState();
}

class _CardWidgetYeasrAndSubjectState extends State<CardWidgetYeasrAndSubject> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          const LevelsScreen(),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 70,
                alignment: Alignment.center,
                // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  widget.subject,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  widget.description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
