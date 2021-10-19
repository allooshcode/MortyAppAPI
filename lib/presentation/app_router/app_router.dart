import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morty_app/bussiness/morty_cubit.dart';
import 'package:morty_app/data/repository/morty_repository.dart';
import 'package:morty_app/data/web_services/dio_services.dart';
import 'package:morty_app/presentation/screens/characters_page.dart';
import 'package:morty_app/presentation/screens/home_page.dart';
import 'package:morty_app/presentation/screens/splash_page.dart';
import 'package:morty_app/shared/constants.dart';

class AppRouter {
  static final characterCubit =
      MortyCharacterCubit(MortyRepository(DioService()));

  static Route onGenerateRoute(RouteSettings? settings) {
    switch (settings!.name) {
      case homePage:
        return MaterialPageRoute(builder: (ctx) => const HomePage());
      case characterPage:
        return MaterialPageRoute(
            builder: (ctx) => BlocProvider<MortyCharacterCubit>.value(
                value: characterCubit..getCharacters(),
                child: const CharactersPage()));
      case splashPage:
        return MaterialPageRoute(builder: (ctx) => const SplashPage());

      default:
        return MaterialPageRoute(builder: (ctx) => const HomePage());
    }
  }

  static Route onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (ctx) => BlocProvider<MortyCharacterCubit>.value(
            value: characterCubit..getCharacters(),
            child: const CharactersPage()));
  }
}
