import 'package:flutter/material.dart';
import 'package:his_quiz/compitition_seasons/components/card_widget.dart';

class UpcomingTabScreen extends StatefulWidget {
  const UpcomingTabScreen({super.key});

  @override
  State<UpcomingTabScreen> createState() => _UpcomingTabScreenState();
}

class _UpcomingTabScreenState extends State<UpcomingTabScreen> {
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
              return CardWidget(
                index: index,
              );
            },
          ),
        ),
      ],
    );
  }
}
