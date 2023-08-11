import 'package:StreamMaster/components/flutter_flow/xtheme.dart';
import 'package:flutter/material.dart';

import 'models/onboarding_card_model.dart';

class OnboardingCard extends StatelessWidget {
  final OnboardingCardModel candidate;

  const OnboardingCard(
      this.candidate, {
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(80)),
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 10),
          )
        ],
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 300,child: Text(candidate.main_text,style: XTheme.of(context).headlineSmall,)),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: candidate.color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}