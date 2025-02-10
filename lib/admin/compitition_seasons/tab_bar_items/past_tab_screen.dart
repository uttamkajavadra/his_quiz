import 'package:flutter/material.dart';
import 'package:his_quiz/admin/compitition_seasons/components/card_widget.dart';

class PastTabScreen extends StatefulWidget {
  const PastTabScreen({super.key});

  @override
  State<PastTabScreen> createState() => _PastTabScreenState();
}

class _PastTabScreenState extends State<PastTabScreen> {
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
