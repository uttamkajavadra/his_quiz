import 'package:flutter/material.dart';
import 'package:his_quiz/levels/components/card_widget_select_country.dart';

class StateTabScreen extends StatefulWidget {
  const StateTabScreen({super.key});

  @override
  State<StateTabScreen> createState() => _StateTabScreenState();
}

class _StateTabScreenState extends State<StateTabScreen> {
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
              return CardWidgetSelectCountry(
                index: index,
              );
            },
          ),
        ),
      ],
    );
  }
}
