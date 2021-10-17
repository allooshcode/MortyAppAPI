import 'dart:io';

import 'package:flutter/material.dart';
import 'package:morty_app/data/models/morty_model.dart';
import 'package:morty_app/shared/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailsScreen extends StatefulWidget {
  final Character character;

  const DetailsScreen({Key? key, required this.character}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(characterPage);
              },
              icon: const Icon(Icons.close_fullscreen))
        ],
      ),
      body: SafeArea(
        child: Stack(children: [
          Column(
            children: [
              Hero(
                tag: widget.character.name!,
                child: Image.network(widget.character.image!),
              ),
              // Expanded(
              //   // ignore: avoid_unnecessary_containers
              //   child: Container(
              //     child: WebView(
              //       javascriptMode: JavascriptMode.unrestricted,
              //       initialUrl: widget.character.location!.url,
              //       onPageFinished: (_) {
              //         setState(() {
              //           isLoading = false;
              //         });
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
          if (isLoading) const LinearProgressIndicator()
        ]),
      ),
    );
  }
}
