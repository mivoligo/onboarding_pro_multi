import 'package:flutter/material.dart';

class FancyText extends StatelessWidget {
  const FancyText({super.key, required this.text});

  final String text;

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
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                : TextSpan(text: chunks[i]),
        ],
      ),
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
