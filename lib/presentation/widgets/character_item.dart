import 'dart:async';

import 'package:flutter/material.dart';
import 'package:morty_app/data/models/morty_model.dart';
import 'package:morty_app/presentation/screens/details_screen.dart';
import 'package:morty_app/presentation/widgets/animated_text.dart';

class CharacterItem extends StatefulWidget {
  final Character character;
  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  State<CharacterItem> createState() => _CharacterItemState();
}

class _CharacterItemState extends State<CharacterItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  @override
  void initState() {
    // TODO: implement initState

    _controller = AnimationController(
      duration: const Duration(milliseconds: 666),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      _controller,
    );

    // _controller.reverse().then((value) => _controller.forward());

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateToDetails(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(child: _buildCharacterImage(widget.character)),
            const SizedBox(
              width: 12,
            ),
            _buildCharacterInformation(context),
          ],
        ),
      ),
    );

    // TODO: implement build
  }

  Widget _buildCharacterInformation(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildTextHeader(context),
          _buildTextOrigin(context),
          const SizedBox(
            height: 12,
          ),
          _buildPublishedAt(context),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildText({
    required String text,
    int maxLine = 1,
    required TextStyle style,
  }) {
    return Text(
      text,
      maxLines: maxLine,
      style: style,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildTextOrigin(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedText(
        text: widget.character.origin!.name.toString(),
        maxLine: 2,
        begin: 8,
        end: 14,
      ),
    );
  }

  Widget _buildPublishedAt(BuildContext context) {
    return AnimatedText(
      text: widget.character.created!,
      end: 10,
      begin: 0,
      color: Colors.blue,
    );
  }

  Widget _buildTextHeader(BuildContext context) {
    return AnimatedText(
        text: widget.character.name!,
        color: Colors.greenAccent,
        begin: 5,
        end: 20);
  }

  Widget _buildCharacterImage(Character character) {
    return FadeTransition(
      opacity: _animation,
      child: Image.network(
        character.image!,
        height: 100,
        width: 150,
        fit: BoxFit.cover,
      ),
    );
  }

  void navigateToDetails(BuildContext context) {
    Navigator.of(context, rootNavigator: true)
        .pushReplacement(MaterialPageRoute(
      builder: (context) => DetailsScreen(
        character: widget.character,
      ),
    ));
  }
}
