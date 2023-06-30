

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:the_news_app/NewsAPI/controller/news_controller.dart';


class WebViewNews extends StatefulWidget{
  final String newsUrl;
  const WebViewNews({Key? key, required this.newsUrl}): super(key:key);

  @override
  State<WebViewNews> createState() => _WebViewNewsState();
}

class _WebViewNewsState extends State<WebViewNews> {
  double _progress = 0;
  late InAppWebViewController inAppWebViewController;
  

  NewsController newsController = NewsController();


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse(widget.newsUrl),
            ),
            onWebViewCreated: (InAppWebViewController controller){
              inAppWebViewController = controller;
            },
            onProgressChanged: (InAppWebViewController controller, int progress){
              setState(() {
                _progress = progress/ 100;
              });
            },
          ),
          _progress < 1 ? Container(
            child: LinearProgressIndicator(
              value: _progress,
            ),
          ): const SizedBox()
        ],
      )
    );
  }
}

/*WebViewWidget(
        initialUrl: widget.newsUrl,
        javaScriptMode: JavaScriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController){
          setState(() {
            controller.complete(webViewController);
          });
        }
      ) */