import 'package:morty_app/data/models/morty_model.dart';

abstract class MortyCharacterState {}

class MortyCharacterInitState extends MortyCharacterState {}

class MortyCharacterLoadingState extends MortyCharacterState {}

class MortyCharacterSuccessState extends MortyCharacterState {
  final List<Character> characters;
  MortyCharacterSuccessState(this.characters);
}

class MortyCharacterErrorState extends MortyCharacterState {
  final String? err;
  MortyCharacterErrorState(this.err);
}
