import 'package:flutter/material.dart';
import 'package:onboarding_pro_multi/colors.dart';
import 'package:onboarding_pro_multi/strings.dart';
import 'package:onboarding_pro_multi/widgets/fancy_text.dart';
import 'package:onboarding_pro_multi/widgets/navigation_buttons.dart';

class NavigationPart extends StatelessWidget {
  const NavigationPart({
    required this.description,
    required this.onNextPressed,
    required this.onSkipPressed,
    required this.onStartPressed,
    required this.hasMoreSteps,
    required this.isInWideLayout,
    super.key,
  });

  final String description;
  final VoidCallback onNextPressed;
  final VoidCallback onSkipPressed;
  final VoidCallback onStartPressed;
  final bool hasMoreSteps;
  final bool isInWideLayout;

  @override
  Widget build(BuildContext context) {
    final mainTextStyle = Theme.of(context).textTheme.titleLarge;

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!isInWideLayout) const SizedBox(height: 72.0),
          Expanded(
            child: Align(
              alignment:
                  isInWideLayout ? Alignment.center : Alignment.topCenter,
              child: FancyText(
                text: description,
                mainStyle: mainTextStyle?.copyWith(
                  color: const Color(mainTextColor),
                ),
                fancyStyle: mainTextStyle?.copyWith(
                  color: const Color(mainTextColor),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 64.0),
            child: hasMoreSteps
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SkipButton(
                        label: buttonSkip,
                        onPressed: onSkipPressed,
                      ),
                      ForwardButton(
                        label: buttonForward,
                        onPressed: onNextPressed,
                      ),
                    ],
                  )
                : StartButton(label: buttonStart, onPressed: onStartPressed),
          ),
        ],
      ),
    );
  }
}
