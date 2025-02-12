import 'package:flutter/material.dart';
import 'package:his_quiz/quiz_rounds/speed_round/winner_list/components/card_widget_winner_list.dart';

class WinnerTabScreen extends StatefulWidget {
  final int lengthOfList;
  const WinnerTabScreen({
    super.key,
    required this.lengthOfList,
  });

  @override
  State<WinnerTabScreen> createState() => _WinnerTabScreenState();
}

class _WinnerTabScreenState extends State<WinnerTabScreen> {
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
              );
            },
          ),
        ),
      ],
    );
  }
}
