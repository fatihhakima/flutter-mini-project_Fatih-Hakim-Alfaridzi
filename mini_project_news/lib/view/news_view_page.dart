import 'package:flutter/material.dart';
import 'package:mini_project_news/widget/custom_title_text.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsViewPage extends StatefulWidget {
  final String newsUrl;

  const NewsViewPage({super.key, required this.newsUrl});

  @override
  State<NewsViewPage> createState() => _NewsViewPageState();
}

class _NewsViewPageState extends State<NewsViewPage> {

  //inisialisasi webview
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(Uri.parse(widget.newsUrl));
  }

  // final controller = WebViewController()
  // ..setJavaScriptMode(JavaScriptMode.disabled)
  // ..loadRequest(Uri.parse(newsUrl));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextTitle(),
        centerTitle: true,
        elevation: 0,
        ),
        body: WebViewWidget(controller: controller),
    );
  }
}