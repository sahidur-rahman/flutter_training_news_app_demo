import 'news_model.dart';

const String url = 'https://newsapi.org/v2/';
const String topHeadlines = 'top-headlines';
const String country = 'in';
const String sortBY = 'publishedAt';
const String apiKey = '2582f1d5095d40489945faf2f302ef65';

List<NewsModel> newsList = [];
List<String> category = [
  'All',
  'business',
  'entertainment',
  'general',
  'health',
  'science',
  'sports',
  'technology',
];

int activeCategoryIndex = 0;
