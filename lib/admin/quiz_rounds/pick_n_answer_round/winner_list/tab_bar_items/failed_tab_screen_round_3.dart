import 'package:flutter/material.dart';
import 'package:his_quiz/admin/quiz_rounds/pick_n_answer_round/winner_list/components/card_widget_winner_list_round_3.dart';

class FailedTabScreenRound3 extends StatefulWidget {
  final int lengthOfList;
  const FailedTabScreenRound3({
    super.key,
    required this.lengthOfList,
  });

  @override
  State<FailedTabScreenRound3> createState() => _FailedTabScreenRound3State();
}

class _FailedTabScreenRound3State extends State<FailedTabScreenRound3> {
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
              return CardWidgetWinnerListRound3(
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
