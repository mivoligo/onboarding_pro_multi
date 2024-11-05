import 'package:flutter/material.dart';

class FancyText extends StatelessWidget {
  const FancyText({
    required this.text,
    required this.mainStyle,
    required this.fancyStyle,
    super.key,
  });

  final String text;
  final TextStyle? mainStyle;
  final TextStyle? fancyStyle;

  @override
  Widget build(BuildContext context) {
    final chunks = _stringChunks(text);

    return Text.rich(
      TextSpan(
        children: [
          for (int i = 0; i < chunks.length; i++)
            i.isOdd
                ? TextSpan(
                    text: chunks[i],
                    style: fancyStyle,
                  )
                : TextSpan(
                    text: chunks[i],
                    style: mainStyle,
                  ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}

List<String> _stringChunks(String input) {
  const openingTag = '<em>';
  const closingTag = '</em>';

  final chunks = <String>[];

  final splitByOpeningTag = input.split(openingTag);
  for (final part in splitByOpeningTag) {
    chunks.addAll(part.split(closingTag));
  }
  return chunks;
}
