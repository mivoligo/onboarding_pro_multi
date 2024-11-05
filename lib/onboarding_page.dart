import 'package:flutter/material.dart';
import 'package:onboarding_pro_multi/strings.dart';
import 'package:onboarding_pro_multi/widgets/fancy_text.dart';

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
    return Scaffold(
      backgroundColor: Color(0xFF3e6fa7),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FancyText(text: steps[currentStep]),
            Expanded(child: Text(currentStep.toString())),
            if (currentStep < steps.length - 1)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: skipOnboarding, child: Text(buttonSkip)),
                  FilledButton(
                    onPressed: toNextStep,
                    child: Text(buttonForward),
                  )
                ],
              )
            else
              FilledButton(onPressed: resetProgress, child: Text(buttonStart)),
            SizedBox(height: 64),
          ],
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
