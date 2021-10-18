import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText(
      {Key? key,
      required this.text,
      required this.begin,
      this.color = Colors.black,
      required this.end,
      this.maxLine = 1})
      : super(key: key);

  final String text;
  final double begin;
  final double end;
  final int maxLine;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: Tween(begin: begin, end: end),
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        builder: (context, value, ch) {
          return Text(
            text,
            maxLines: maxLine,
            style: TextStyle(fontSize: value, color: color),
            overflow: TextOverflow.ellipsis,
          );
        });
  }
}
