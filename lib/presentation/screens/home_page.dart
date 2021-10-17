import 'package:flutter/material.dart';
import 'package:morty_app/presentation/app_router/app_router.dart';
import 'package:morty_app/shared/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('home');
    return const Scaffold(
      body: Center(
        child: Text('this is home'),
      ),
      // body: Navigator(
      //   initialRoute: characterPage,
      //   onGenerateRoute: AppRouter.onGenerateRoute,
      // ),
    );
  }
}
