import 'package:flutter/material.dart';
import 'package:news_app/news_app_body.dart';

class NewsAppHome extends StatefulWidget {
  const NewsAppHome({Key? key}) : super(key: key);

  @override
  _NewsAppHomeState createState() => _NewsAppHomeState();
}

class _NewsAppHomeState extends State<NewsAppHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News India'),
        centerTitle: true,
      ),
      body: NewsAppBody(),
    );
  }
}
