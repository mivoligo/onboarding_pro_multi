import 'package:flutter/material.dart';
import 'package:onboarding_pro_multi/step_model.dart';

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
              child: _SingleDecorAnimatedWidget(
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

class _SingleDecorAnimatedWidget extends AnimatedWidget {
  _SingleDecorAnimatedWidget({
    required this.child,
    required int index,
    required int listLength,
    required super.listenable,
  }) : scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: listenable as Animation<double>,
            curve: Interval(
              0.5 / (listLength - 1) * index,
              0.5 + 0.5 / (listLength - 1) * index,
              curve: Curves.elasticOut,
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
