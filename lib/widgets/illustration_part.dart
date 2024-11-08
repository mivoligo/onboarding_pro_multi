import 'package:flutter/material.dart';
import 'package:onboarding_pro_multi/colors.dart';

class IllustrationPart extends StatelessWidget {
  const IllustrationPart({
    required this.pageController,
    required this.onPageChanged,
    required this.currentPage,
    super.key,
  });

  final PageController? pageController;
  final Function(int)? onPageChanged;
  final int currentPage;

  static const imageAssets = {
    0: 'line-0.png',
    1: 'line-1.png',
    2: 'line-2.png',
    5: 'line-5.png',
  };

  static const foregroundImages = {
    0: '0-f.png',
    1: '1-f.png',
    2: '2-f.png',
    3: '3-f.png',
    4: '4-f.png',
    5: '5-f.png',
  };
  static const backgroundImages = {
    0: '0-b.png',
    1: '1-b.png',
    2: '2-b.png',
    3: '3-b.png',
    4: '4-b.png',
    5: '5-b.png',
  };

  static const gradientOffset = {
    0: Alignment.center,
    1: Alignment(0.25, 0.25),
    2: Alignment.center,
    3: Alignment(0.25, 0),
    4: Alignment.center,
    5: Alignment(0.25, 0),
  };

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [Colors.white38, const Color(backgroundColor).withAlpha(100)],
          center: gradientOffset[currentPage]!,
          radius: 0.4,
        ),
      ),
      child: PageView.builder(
        controller: pageController,
        onPageChanged: onPageChanged,
        itemCount: 6,
        clipBehavior: Clip.hardEdge,
        itemBuilder: (context, index) {
          return PartOne(
            progress: index,
            imageAsset: imageAssets[index],
            foregroundImage: foregroundImages[index]!,
            backgroundImage: backgroundImages[index]!,
          );
        },
      ),
    );
  }
}

class PartOne extends StatelessWidget {
  const PartOne({
    required this.progress,
    required this.foregroundImage,
    required this.backgroundImage,
    this.imageAsset,
    super.key,
  });

  final int progress;
  final String? imageAsset;
  final String foregroundImage;
  final String backgroundImage;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            if (imageAsset != null)
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/$imageAsset',
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
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
                child: Image.asset('assets/images/$backgroundImage'),
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
                child: Image.asset('assets/images/$foregroundImage'),
              ),
            ),
          ],
        );
      },
    );
  }
}
