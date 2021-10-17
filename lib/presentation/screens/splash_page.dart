import 'package:flutter/material.dart';
import 'package:morty_app/shared/constants.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(characterPage);
          },
          child: const Text('go home'),
        ),
      ),
    );
  }
}
