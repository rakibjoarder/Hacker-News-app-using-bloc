import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends StatefulWidget {
  final url;
  final fromComment;
  ArticlePage({this.url, this.fromComment});
  @override
  _ArticlePageState createState() =>
      _ArticlePageState(url: url, fromComment: fromComment);
}

class _ArticlePageState extends State<ArticlePage>
    with AutomaticKeepAliveClientMixin {
  var url;
  final fromComment;

  _ArticlePageState({this.url, this.fromComment = false});
  bool isLoading = true;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: fromComment == true ? AppBar() : null,
      body: Builder(builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            isLoading
                ? Center(
                    child: LinearProgressIndicator(),
                  )
                : Container(),
            Expanded(
              child: WebView(
                initialUrl: url,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
                navigationDelegate: (NavigationRequest request) {
                  print('allowing navigation to $request');
                  return NavigationDecision.navigate;
                },
                onPageStarted: (String url) {
                  print('Page started loading: $url');
                },
                onPageFinished: (String url) {
                  print('Page finished loading: $url');
                  setState(() {
                    isLoading = false;
                  });
                },
                gestureNavigationEnabled: true,
              ),
            ),
          ],
        );
      }),
    );
  }

  // to keep the state of the  page
  @override
  bool get wantKeepAlive => true;
}
