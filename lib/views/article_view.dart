import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;
  const ArticleView({Key? key, required this.blogUrl}) : super(key: key);

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        iconTheme:const  IconThemeData(
          color: Colors.black, //change your color here
        ),
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Flutter",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "News",
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
      actions:  [
        Opacity(
          opacity: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Icon(Icons.save)),
        ),
      ],
      elevation: 0.0,
    ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.blogUrl,
          onWebViewCreated: ((WebViewController webViewController){
            _completer.complete(webViewController);
          }),
        ),
      ),

    );
  }
}
