import 'package:flutter/material.dart';
import 'package:morty_app/shared/constants.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText(
      {Key? key,
      this.isSplash = false,
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
  final bool isSplash;

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
