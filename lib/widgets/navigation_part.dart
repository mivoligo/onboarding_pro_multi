import 'package:flutter/material.dart';
import 'package:onboarding_pro_multi/strings.dart';
import 'package:onboarding_pro_multi/widgets/navigation_buttons.dart';

class NavigationPart extends StatelessWidget {
  const NavigationPart({
    required this.onNextPressed,
    required this.onSkipPressed,
    required this.onStartPressed,
    required this.hasMoreSteps,
    super.key,
  });

  final VoidCallback onNextPressed;
  final VoidCallback onSkipPressed;
  final VoidCallback onStartPressed;
  final bool hasMoreSteps;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
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
    );
  }
}
