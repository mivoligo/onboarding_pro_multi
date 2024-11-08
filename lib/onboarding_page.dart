import 'package:flutter/material.dart';
import 'package:onboarding_pro_multi/colors.dart';
import 'package:onboarding_pro_multi/home_page.dart';
import 'package:onboarding_pro_multi/steps.dart';
import 'package:onboarding_pro_multi/widgets/illustration_part.dart';
import 'package:onboarding_pro_multi/widgets/navigation_part.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  static const steps = stepsList;

  int currentStep = 0;

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
            return Stack(
              children: [
                Positioned(
                  width: isWideLayout
                      ? constraints.maxWidth / 2
                      : constraints.maxWidth,
                  bottom: isWideLayout ? 0 : 100,
                  top: 0,
                  child: IllustrationPart(
                    pageController: pageController,
                    onPageChanged: (pageNumber) {
                      setState(() {
                        currentStep = pageNumber;
                      });
                    },
                    currentPage: currentStep,
                    stepsList: steps,
                  ),
                ),
                Positioned(
                  left: isWideLayout ? constraints.maxWidth / 2 : 0,
                  width: isWideLayout
                      ? constraints.maxWidth / 2
                      : constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: NavigationPart(
                    description: steps[currentStep].label,
                    onNextPressed: toNextStep,
                    onSkipPressed: toMainView,
                    onStartPressed: toMainView,
                    hasMoreSteps: currentStep < lastStep,
                    isInWideLayout: isWideLayout,
                  ),
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
        pageController?.animateToPage(
          currentStep,
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
