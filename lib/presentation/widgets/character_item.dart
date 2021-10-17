import 'package:flutter/material.dart';
import 'package:morty_app/data/models/morty_model.dart';
import 'package:morty_app/presentation/screens/details_screen.dart';

class ListItem extends StatelessWidget {
  final Character character;
  const ListItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateToDetails(context),
      child: Row(
        children: [
          Expanded(child: _buildArticleImage(character)),
          const SizedBox(
            width: 12,
          ),
          _buildArticleInformation(context),
        ],
      ),
    );

    // TODO: implement build
  }

  Widget _buildArticleInformation(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildTextHeader(context),
          _buildTextDescripetion(context),
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

  Widget _buildText(
      {required String text, int maxLine = 1, required TextStyle style}) {
    return Text(
      text,
      maxLines: maxLine,
      style: style,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildTextDescripetion(context) {
    return _buildText(
        text: character.created.toString(),
        maxLine: 2,
        style: Theme.of(context).textTheme.bodyText1!);
  }

  Widget _buildPublishedAt(BuildContext context) {
    return _buildText(
        text: character.gender!, style: Theme.of(context).textTheme.bodyText2!);
  }

  Widget _buildTextHeader(BuildContext context) {
    return _buildText(
        text: character.name!, style: Theme.of(context).textTheme.bodyText1!);
  }

  Widget _buildArticleImage(Character character) {
    return Image.network(
      character.image!,
      height: 100,
      width: 150,
      fit: BoxFit.cover,
    );
  }

  void navigateToDetails(BuildContext context) {
    Navigator.of(context, rootNavigator: true)
        .pushReplacement(MaterialPageRoute(
      builder: (context) => DetailsScreen(
        character: character,
      ),
    ));
  }
}
