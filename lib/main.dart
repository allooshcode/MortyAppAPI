import 'package:flutter/material.dart';
import 'package:morty_app/data/web_services/dio_services.dart';
import 'package:morty_app/presentation/app_router/app_router.dart';
import 'package:morty_app/presentation/screens/characters_page.dart';
import 'package:morty_app/presentation/screens/home_page.dart';
import 'package:morty_app/presentation/screens/splash_page.dart';
import 'package:morty_app/shared/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioService.initDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashPage(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      onUnknownRoute: AppRouter.onUnknownRoute,
    );
  }
}
