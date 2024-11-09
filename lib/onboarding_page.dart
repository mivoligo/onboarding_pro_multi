import 'package:flutter/material.dart';
import 'package:onboarding_pro_multi/colors.dart';
import 'package:onboarding_pro_multi/home_page.dart';
import 'package:onboarding_pro_multi/step_model.dart';
import 'package:onboarding_pro_multi/steps.dart';
import 'package:onboarding_pro_multi/widgets/illustration_part.dart';
import 'package:onboarding_pro_multi/widgets/navigation_part.dart';
import 'package:onboarding_pro_multi/widgets/step_description.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  static const steps = stepsList;

  int currentPage = 0;

  int get lastStep => steps.length - 1;

  PageController? pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(backgroundColor),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final isWideLayout = constraints.maxWidth > constraints.maxHeight;

            if (isWideLayout) {
              return _WideLayout(
                currentStep: steps[currentPage],
                currentPage: currentPage,
                pageController: pageController,
                onPageChanged: (pageNumber) {
                  setState(() {
                    currentPage = pageNumber;
                  });
                },
                onNextPressed: toNextStep,
                onSkipPressed: toMainView,
                onStartPressed: toMainView,
                hasMoreSteps: currentPage < lastStep,
              );
            }

            return _NarrowLayout(
              currentStep: steps[currentPage],
              currentPage: currentPage,
              pageController: pageController,
              onPageChanged: (pageNumber) {
                setState(() {
                  currentPage = pageNumber;
                });
              },
              onNextPressed: toNextStep,
              onSkipPressed: toMainView,
              onStartPressed: toMainView,
              hasMoreSteps: currentPage < lastStep,
            );
          },
        ),
      ),
    );
  }

  void toNextStep() {
    if (currentPage < lastStep) {
      currentPage++;
      setState(() {
        pageController?.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      });
    }
  }

  void toMainView() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }
}

class _NarrowLayout extends StatelessWidget {
  const _NarrowLayout({
    required this.currentStep,
    required this.currentPage,
    required this.pageController,
    required this.onPageChanged,
    required this.onNextPressed,
    required this.onSkipPressed,
    required this.onStartPressed,
    required this.hasMoreSteps,
  });

  final SingleStep currentStep;
  final int currentPage;
  final PageController? pageController;
  final Function(int) onPageChanged;
  final VoidCallback onNextPressed;
  final VoidCallback onSkipPressed;
  final VoidCallback onStartPressed;
  final bool hasMoreSteps;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 72.0),
        StepDescription(description: currentStep.label),
        Expanded(
          child: IllustrationPart(
            pageController: pageController,
            onPageChanged: onPageChanged,
            currentPage: currentPage,
            stepsList: stepsList,
          ),
        ),
        NavigationPart(
          onNextPressed: onNextPressed,
          onSkipPressed: onSkipPressed,
          onStartPressed: onStartPressed,
          hasMoreSteps: hasMoreSteps,
        ),
      ],
    );
  }
}

class _WideLayout extends StatelessWidget {
  const _WideLayout({
    required this.currentStep,
    required this.currentPage,
    required this.pageController,
    required this.onPageChanged,
    required this.onNextPressed,
    required this.onSkipPressed,
    required this.onStartPressed,
    required this.hasMoreSteps,
  });

  final SingleStep currentStep;
  final int currentPage;
  final PageController? pageController;
  final Function(int) onPageChanged;
  final VoidCallback onNextPressed;
  final VoidCallback onSkipPressed;
  final VoidCallback onStartPressed;
  final bool hasMoreSteps;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: IllustrationPart(
            pageController: pageController,
            onPageChanged: onPageChanged,
            currentPage: currentPage,
            stepsList: stepsList,
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: StepDescription(description: currentStep.label),
                ),
              ),
              NavigationPart(
                onNextPressed: onNextPressed,
                onSkipPressed: onSkipPressed,
                onStartPressed: onStartPressed,
                hasMoreSteps: hasMoreSteps,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
