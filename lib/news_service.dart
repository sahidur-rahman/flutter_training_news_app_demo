import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/constant.dart';
import 'package:news_app/news_model.dart';

class NewsService {
  getNews([String? keyword, int? categoryIndex]) async {
    String url;

    if (keyword != null) {
      url = generateUrl(isDefault: false) + '&q=' + keyword;
    } else {
      url = generateUrl() +
          (activeCategoryIndex == 0
              ? ''
              : '&category=${category[activeCategoryIndex]}');
    }

    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print('request status code 200');

      var newsData = jsonDecode(response.body);
      List<dynamic> newses = newsData['articles'];
      for (var map in newses) {
        NewsModel model = NewsModel();

        model.setContent = map['content'].toString();
        model.setDescription = map['description'];
        model.setImageUrl = map['urlToImage'] ?? '';
        model.setTitle = map['title'];
        model.setPubDate = map['publishedAt'];
        model.setUrl = map['url'];

        newsList.add(model);
      }
    } else {
      print('request status code Unknown: ${response.statusCode}');
    }
  }

  generateUrl({bool isDefault = true}) {
    if (isDefault) {
      return url +
          topHeadlines +
          '?country=' +
          country +
          '&sortBy=' +
          sortBY +
          '&apikey=' +
          apiKey;
    } else {
      return url + 'everything?' + 'sortBy=' + sortBY + '&apikey=' + apiKey;
    }
  }

  loadNews() {
    for (int i = 0; i < 10; i++) {
      NewsModel model = NewsModel();

      model.setContent = 'Test content $i';
      model.setDescription = 'Test Description $i';
      model.setImageUrl = 'http://www.google.com';
      model.setTitle = 'Test title $i';
      model.setPubDate = 'Test date: $i: 11-2022';
      model.setUrl = 'Test Url : http://www.google.com';

      newsList.add(model);
    }
  }
}
