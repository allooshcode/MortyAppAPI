import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morty_app/bussiness/morty_cubit.dart';
import 'package:morty_app/bussiness/morty_states.dart';
import 'package:morty_app/presentation/widgets/characters_listview.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MortyCharacterCubit, MortyCharacterState>(
          builder: (context, state) {
        final characters =
            BlocProvider.of<MortyCharacterCubit>(context).characters;

        return CharacterListView(state: state, characters: characters);
      }),
    );
  }
}
