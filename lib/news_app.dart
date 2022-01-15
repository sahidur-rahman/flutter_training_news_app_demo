import 'package:flutter/material.dart';
import 'package:news_app/news_app_home.dart';
import 'package:news_app/news_detail.dart';
import 'package:news_app/news_service.dart';

class NewsApp extends StatefulWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NewsAppHome(),
    );
  }
}
