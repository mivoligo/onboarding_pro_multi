import 'package:flutter/material.dart';

class IllustrationPart extends StatelessWidget {
  const IllustrationPart({
    required this.pageController,
    required this.children,
    required this.onPageChanged,
    super.key,
  });

  final PageController pageController;
  final List<Widget> children;
  final Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: onPageChanged,
      children: children,
    );
  }
}
