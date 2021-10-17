import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morty_app/bussiness/morty_states.dart';
import 'package:morty_app/data/models/morty_model.dart';
import 'package:morty_app/data/repository/morty_repository.dart';

class MortyCharacterCubit extends Cubit<MortyCharacterState> {
  MortyCharacterCubit(this._mortyRepository) : super(MortyCharacterInitState());
  final MortyRepository _mortyRepository;

  List<Character> _characters = [];

  List<Character> get characters {
    return _characters;
  }

  void getCharacters() {
    emit(MortyCharacterLoadingState());

    _mortyRepository.getCharacters().then((value) {
      _characters = value;
      emit(MortyCharacterSuccessState(_characters));
    }).catchError((err) {
      emit(MortyCharacterErrorState(err.toString()));
    });
  }
}
