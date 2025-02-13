import 'package:flutter/material.dart';
import 'package:his_quiz/quiz_rounds/speed_round/winner_list/components/card_widget_winner_list.dart';

class FailedTabScreen extends StatefulWidget {
  final int lengthOfList;
  const FailedTabScreen({
    super.key,
    required this.lengthOfList,
  });

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
            itemCount: widget.lengthOfList,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            itemBuilder: (context, index) {
              return CardWidgetWinnerList(
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
