import 'package:flutter/material.dart';

class SingleStep {
  const SingleStep({
    required this.label,
    required this.foregroundImage,
    required this.backgroundImage,
    required this.backgroundGradientAlignment,
    required this.decorImages,
  });

  final String label;
  final String foregroundImage;
  final String backgroundImage;
  final Alignment backgroundGradientAlignment;
  final List<Decor> decorImages;
}

class Decor {
  const Decor({
    required this.image,
    required this.alignment,
  });

  final String image;
  final Alignment alignment;
}
