import 'package:flutter/material.dart';
import 'package:onboarding_pro_multi/colors.dart';
import 'package:onboarding_pro_multi/strings.dart';
import 'package:onboarding_pro_multi/widgets/navigation_part.dart';

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

  int get lastStep => steps.length - 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(backgroundColor),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWideLayout = constraints.maxWidth > constraints.maxHeight;
          return Row(
            children: [
              if (isWideLayout) const Spacer(),
              Expanded(
                child: NavigationPart(
                  description: steps[currentStep],
                  onNextPressed: toNextStep,
                  onSkipPressed: skipOnboarding,
                  onStartPressed: resetProgress,
                  hasMoreSteps: currentStep < lastStep,
                  isInWideLayout: isWideLayout,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void toNextStep() {
    if (currentStep < lastStep) {
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
      currentStep = lastStep;
    });
  }
}
