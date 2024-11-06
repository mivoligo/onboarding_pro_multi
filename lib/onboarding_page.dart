import 'package:flutter/material.dart';
import 'package:onboarding_pro_multi/colors.dart';
import 'package:onboarding_pro_multi/strings.dart';
import 'package:onboarding_pro_multi/widgets/illustration_part.dart';
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

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(backgroundColor),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final isWideLayout = constraints.maxWidth > constraints.maxHeight;
            return Stack(
              children: [
                IllustrationPart(
                  pageController: pageController,
                  onPageChanged: (pageNumber) {
                    print('pageNumber = $pageNumber');
                    setState(() {
                      currentStep = pageNumber;
                    });
                    // toNextStep();
                  },
                  children: steps
                      .map(
                        (e) => Container(
                          color: Colors.redAccent
                              .withAlpha(255 ~/ (steps.indexOf(e) + 1)),
                          child: Center(
                            child: Text(
                              steps.indexOf(e).toString(),
                              style: const TextStyle(
                                fontSize: 64,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                NavigationPart(
                  description: steps[currentStep],
                  onNextPressed: toNextStep,
                  onSkipPressed: skipOnboarding,
                  onStartPressed: resetProgress,
                  hasMoreSteps: currentStep < lastStep,
                  isInWideLayout: isWideLayout,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void toNextStep() {
    if (currentStep < lastStep) {
      currentStep++;
      setState(() {
        pageController.animateToPage(
          currentStep,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      });
    }
  }

  void resetProgress() {
    setState(() {
      currentStep = 0;
      pageController.jumpToPage(currentStep);
    });
  }

  void skipOnboarding() {
    setState(() {
      currentStep = lastStep;
      pageController.jumpToPage(currentStep);
    });
  }
}
