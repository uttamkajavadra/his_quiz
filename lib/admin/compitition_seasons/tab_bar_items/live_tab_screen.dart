import 'package:flutter/material.dart';
import 'package:his_quiz/admin/compitition_seasons/components/card_widget.dart';

class LiveTabScreen extends StatefulWidget {
  const LiveTabScreen({super.key});

  @override
  State<LiveTabScreen> createState() => _LiveTabScreenState();
}

class _LiveTabScreenState extends State<LiveTabScreen> {
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
