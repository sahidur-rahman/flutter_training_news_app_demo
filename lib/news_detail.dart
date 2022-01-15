import 'package:flutter/material.dart';
import 'package:news_app/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetail extends StatefulWidget {
  final int index;
  const NewsDetail({Key? key, required this.index}) : super(key: key);

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 24),
        constraints: const BoxConstraints.expand(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.blueAccent,
              padding: const EdgeInsets.all(8),
              child: Text(
                newsList[widget.index].getTitle,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 32,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          newsList[widget.index].getPubDate,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    Image.network(newsList[widget.index].getImageUrl),
                    Expanded(
                      child: Text(
                        newsList[widget.index].getContent,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const Text(
                      'Read full news:',
                      style: TextStyle(fontSize: 18),
                    ),
                    InkWell(
                      onTap: () {
                        _launchURL(newsList[widget.index].getUrl);
                      },
                      child: Text(
                        newsList[widget.index].getUrl,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          }),
    );
  }

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
