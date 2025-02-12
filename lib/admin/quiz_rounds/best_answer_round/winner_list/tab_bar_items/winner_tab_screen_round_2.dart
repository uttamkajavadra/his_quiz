import 'package:flutter/material.dart';
import 'package:his_quiz/admin/quiz_rounds/best_answer_round/winner_list/components/card_widget_winner_list_round_2.dart';

class WinnerTabScreenRound2 extends StatefulWidget {
  final int lengthOfList;
  const WinnerTabScreenRound2({
    super.key,
    required this.lengthOfList,
  });

  @override
  State<WinnerTabScreenRound2> createState() => _WinnerTabScreenRound2State();
}

class _WinnerTabScreenRound2State extends State<WinnerTabScreenRound2> {
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
              );
            },
          ),
        ),
      ],
    );
  }
}
