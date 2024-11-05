import 'package:flutter/material.dart';
import 'package:onboarding_pro_multi/colors.dart';
import 'package:onboarding_pro_multi/strings.dart';
import 'package:onboarding_pro_multi/widgets/fancy_text.dart';
import 'package:onboarding_pro_multi/widgets/navigation_buttons.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final steps = [
    creativeTime,
    events,
    newPlaces,
    reminders,
    upToDate,
    rhythm,
  ];
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final mainTextStyle = Theme.of(context).textTheme.titleLarge;
    return Scaffold(
      backgroundColor: const Color(0xFF3e6fa7),
      body: Center(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FancyText(
                text: steps[currentStep],
                mainStyle:
                    mainTextStyle?.copyWith(color: const Color(mainTextColor)),
                fancyStyle: mainTextStyle?.copyWith(
                  color: const Color(mainTextColor),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(child: Text(currentStep.toString())),
              if (currentStep < steps.length - 1)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SkipButton(label: buttonSkip, onPressed: skipOnboarding),
                    ForwardButton(label: buttonForward, onPressed: toNextStep),
                  ],
                )
              else
                StartButton(label: buttonStart, onPressed: resetProgress),
              const SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }

  void toNextStep() {
    if (currentStep < steps.length - 1) {
      setState(() {
        currentStep++;
      });
    }
  }

  void resetProgress() {
    setState(() {
      currentStep = 0;
    });
  }

  void skipOnboarding() {
    setState(() {
      currentStep = steps.length - 1;
    });
  }
}
