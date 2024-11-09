import 'dart:math';

import 'package:flutter/material.dart';
import 'package:onboarding_pro_multi/utils/colors.dart';
import 'package:onboarding_pro_multi/step_model.dart';
import 'package:onboarding_pro_multi/widgets/decor_images_animation.dart';

class IllustrationPart extends StatelessWidget {
  const IllustrationPart({
    required this.pageController,
    required this.onPageChanged,
    required this.currentPage,
    required this.stepsList,
    super.key,
  });

  final PageController? pageController;
  final Function(int)? onPageChanged;
  final int currentPage;
  final List<SingleStep> stepsList;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: AlignmentTween(
        begin: stepsList[currentPage].backgroundGradientAlignment,
        end: stepsList[currentPage].backgroundGradientAlignment,
      ),
      duration: const Duration(milliseconds: 400),
      builder: (context, value, child) {
        return DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Colors.white38,
                const Color(backgroundColor).withAlpha(100),
              ],
              center: value,
              radius: 0.4,
            ),
          ),
          child: child,
        );
      },
      child: PageView.builder(
        controller: pageController,
        onPageChanged: onPageChanged,
        itemCount: stepsList.length,
        itemBuilder: (context, index) {
          return _SinglePage(
            currentStep: stepsList[index],
          );
        },
      ),
    );
  }
}

class _SinglePage extends StatefulWidget {
  const _SinglePage({
    required this.currentStep,
  });

  final SingleStep currentStep;

  @override
  State<_SinglePage> createState() => _SinglePageState();
}

class _SinglePageState extends State<_SinglePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              width: min(constraints.maxWidth, constraints.maxHeight),
              height: min(constraints.maxWidth, constraints.maxHeight),
              child: DecorImages(
                decorList: widget.currentStep.decorImages,
                animation: _animationController,
              ),
            ),
            TweenAnimationBuilder(
              tween: Tween<double>(
                begin: -constraints.maxWidth,
                end: 0,
              ),
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeOut,
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(value, 0),
                  child: child,
                );
              },
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/${widget.currentStep.backgroundImage}',
                ),
              ),
            ),
            TweenAnimationBuilder(
              tween: Tween<double>(
                begin: 0,
                end: 1,
              ),
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOut,
              builder: (context, value, child) {
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(2 * pi * value),
                  alignment: FractionalOffset.center,
                  child: child,
                );
              },
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/${widget.currentStep.foregroundImage}',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
