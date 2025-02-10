import 'package:flutter/material.dart';
import 'package:his_quiz/admin/quiz_rounds/best_answer_round/winner_list/components/card_widget_winner_list_round_2.dart';

class FailedTabScreenRound2 extends StatefulWidget {
  final int lengthOfList;
  const FailedTabScreenRound2({
    super.key,
    required this.lengthOfList,
  });

  @override
  State<FailedTabScreenRound2> createState() => _FailedTabScreenRound2State();
}

class _FailedTabScreenRound2State extends State<FailedTabScreenRound2> {
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
              return CardWidgetWinnerListRound2(
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
