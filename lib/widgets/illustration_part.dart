import 'dart:math';

import 'package:flutter/material.dart';
import 'package:onboarding_pro_multi/colors.dart';
import 'package:onboarding_pro_multi/step_model.dart';

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
        clipBehavior: Clip.hardEdge,
        itemBuilder: (context, index) {
          return SinglePage(
            progress: index,
            step: stepsList[index],
          );
        },
      ),
    );
  }
}

class SinglePage extends StatefulWidget {
  const SinglePage({
    required this.progress,
    required this.step,
    super.key,
  });

  final int progress;
  final SingleStep step;

  @override
  State<SinglePage> createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
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
            if (widget.step.lineImage != null)
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/${widget.step.lineImage}',
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),
              ),
            Positioned(
              width: min(constraints.maxWidth, constraints.maxHeight),
              height: min(constraints.maxWidth, constraints.maxHeight),
              child: DecorImages(
                decorList: widget.step.decorImages,
                animation: _animationController,
              ),
            ),
            TweenAnimationBuilder(
              tween: Tween<double>(
                begin: -constraints.maxWidth,
                end: 0,
              ),
              duration: const Duration(milliseconds: 500),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(value, 0),
                  child: child,
                );
              },
              child: Align(
                alignment: Alignment.center,
                child:
                    Image.asset('assets/images/${widget.step.backgroundImage}'),
              ),
            ),
            TweenAnimationBuilder(
              tween: Tween<double>(
                begin: constraints.maxWidth,
                end: 0,
              ),
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(value, 0),
                  child: child,
                );
              },
              child: Align(
                alignment: Alignment.center,
                child:
                    Image.asset('assets/images/${widget.step.foregroundImage}'),
              ),
            ),
          ],
        );
      },
    );
  }
}

class SingleDecorAnimatedWidget extends AnimatedWidget {
  SingleDecorAnimatedWidget({
    required this.child,
    required int index,
    required int listLength,
    required super.listenable,
    super.key,
  }) : scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: listenable as Animation<double>,
            curve: Interval(
              0.5 / (listLength - 1) * index,
              0.5 + 0.5 / (listLength - 1) * index,
              curve: Curves.bounceOut,
            ),
          ),
        );

  final Widget child;
  final Animation<double> scaleAnimation;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scaleAnimation.value,
      alignment: Alignment.center,
      child: child,
    );
  }
}

class DecorImages extends StatelessWidget {
  const DecorImages({
    required this.decorList,
    required this.animation,
    super.key,
  });

  final List<Decor> decorList;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: decorList
          .map(
            (decor) => Align(
              alignment: decor.alignment,
              child: SingleDecorAnimatedWidget(
                listenable: animation,
                index: decorList.indexOf(decor),
                listLength: decorList.length,
                child: Image.asset('assets/images/decoration/${decor.image}'),
              ),
            ),
          )
          .toList(),
    );
  }
}
