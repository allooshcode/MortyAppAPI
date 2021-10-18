import 'dart:async';

import 'package:flutter/material.dart';
import 'package:morty_app/bussiness/morty_states.dart';
import 'package:morty_app/data/models/morty_model.dart';
import 'package:morty_app/presentation/widgets/animated_text.dart';
import 'package:morty_app/presentation/widgets/character_item.dart';

class CharacterListView extends StatefulWidget {
  final MortyCharacterState state;
  final List<Character> characters;
  const CharacterListView(
      {Key? key, required this.state, required this.characters})
      : super(key: key);

  @override
  _ArticleListViewState createState() => _ArticleListViewState();
}

class _ArticleListViewState extends State<CharacterListView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      duration: const Duration(milliseconds: 666),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: const Offset(-1, -1),
      end: Offset.zero,
    ).animate(
      _controller,
    );
    if (mounted) {
      _controller.forward();
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final cubit = BlocProvider.of<MortyCharacterCubit>(context);
    // TODO: implement build
    if (widget.state is MortyCharacterLoadingState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (widget.state is MortyCharacterErrorState) {
      return const Center(
        child: AnimatedText(
          text: 'Something went Wrong..',
          begin: 10,
          end: 20,
        ),
      );
    } else {
      return SizedBox(
        child: buildArticlesList(
          characters: widget.characters,
          context: context,
        ),
      );
    }
  }

  Widget buildArticlesList({
    required List<Character> characters,
    required BuildContext context,
  }) {
    // final _cubit = BlocProvider.of<MortyCharacterCubit>(context);
    // bool newPage = false;

    return Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: ListView.builder(
          itemCount: characters.length,
          itemBuilder: (context, index) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SlideTransition(
                  position: _animation,
                  child: CharacterItem(character: characters[index])),
              const Divider(
                endIndent: 20,
                thickness: 6,
              ),
            ],
          ),
        ));
  }
}
