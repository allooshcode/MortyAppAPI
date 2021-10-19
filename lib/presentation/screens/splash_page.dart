import 'dart:async';

import 'package:flutter/material.dart';
import 'package:morty_app/presentation/widgets/animated_text.dart';
import 'package:morty_app/shared/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late Timer time;

  @override
  void initState() {
    time = Timer(const Duration(seconds: 4),
        () => Navigator.of(context).pushNamed(characterPage));
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.2,
      end: 1,
    ).animate(
      _controller,
    );
    if (mounted) {
      _controller.repeat();
    }
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    time.cancel();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: const Text(
            'WELCOME',
            style: TextStyle(color: Colors.blue, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
