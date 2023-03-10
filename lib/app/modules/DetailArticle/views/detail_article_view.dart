import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../data/beritamodel.dart';

class DetailArticleView extends StatefulWidget {
  const DetailArticleView({Key? key}) : super(key: key);

  @override
  State<DetailArticleView> createState() => _DetailArticleViewState();
}

class _DetailArticleViewState extends State<DetailArticleView> {
  Posts? listArticle = Get.arguments;
  late final WebViewController _controller;
  var loadingPercentage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Posts? data = Get.arguments;
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) async {
            // Update loading bar.
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageStarted: (String url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse("${data?.link}"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: BackButton(
            color: Colors.black,
          ),
          title: Text('${listArticle!.title}',
              style: TextStyle(color: Colors.red)),
          backgroundColor: Colors.white,
        ),
        body: Stack(
          children: [
            WebViewWidget(
              controller: _controller,
            ),
            if (loadingPercentage < 100)
              LinearProgressIndicator(
                value: loadingPercentage / 100.0,
              ),
          ],
        ));
  }
}
