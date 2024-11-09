import 'package:flutter/material.dart';
import 'package:onboarding_pro_multi/utils/colors.dart';
import 'package:onboarding_pro_multi/widgets/fancy_text.dart';

class StepDescription extends StatelessWidget {
  const StepDescription({
    required this.description,
    super.key,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    final mainTextStyle = Theme.of(context).textTheme.titleLarge;

    return FancyText(
      text: description,
      mainStyle: mainTextStyle?.copyWith(
        color: const Color(mainTextColor),
      ),
      fancyStyle: mainTextStyle?.copyWith(
        color: const Color(mainTextColor),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
