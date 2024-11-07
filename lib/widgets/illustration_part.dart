import 'package:flutter/material.dart';

class IllustrationPart extends StatelessWidget {
  const IllustrationPart({
    required this.pageController,
    required this.children,
    required this.onPageChanged,
    super.key,
  });

  final PageController? pageController;
  final List<Widget> children;
  final Function(int)? onPageChanged;

  static const imageAssets = {
    0: 'line-0.png',
    1: 'line-1.png',
    2: 'line-2.png',
    5: 'line-5.png',
  };

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: onPageChanged,
      itemCount: 6,
      itemBuilder: (context, index) {
        return PartOne(
          progress: index,
          imageAsset: imageAssets[index],
        );
      },
      // children: [...children.sublist(0, children.length - 1), PartOne(progress: 4  ?? 0,)],
    );
  }
}

class PartOne extends StatelessWidget {
  const PartOne({required this.progress, this.imageAsset, super.key});

  final int progress;
  final String? imageAsset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.redAccent.withOpacity(0.5)),
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
          tween: Tween(begin: 16.0, end: 48.0),
          duration: const Duration(milliseconds: 1000),
          builder: (context, value, child) {
            return Center(
              child: Text(
                'data',
                style: TextStyle(fontSize: value),
              ),
            );
          },
        ),
      ],
    );
  }
}
