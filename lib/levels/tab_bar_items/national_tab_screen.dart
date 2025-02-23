import 'package:flutter/material.dart';
import 'package:his_quiz/levels/components/card_widget_select_country.dart';

class NationalTabScreen extends StatefulWidget {
  const NationalTabScreen({super.key});

  @override
  State<NationalTabScreen> createState() => _NationalTabScreenState();
}

class _NationalTabScreenState extends State<NationalTabScreen> {
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
