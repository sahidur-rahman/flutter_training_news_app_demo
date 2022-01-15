// ignore_for_file: prefer_typing_uninitialized_variables

class NewsModel {
  late String _title;
  late String _description;
  late var _url;
  late var _imageUrl;
  late String _pubDate;
  late String _content;

  get getTitle => _title;

  set setTitle(title) => _title = title;

  get getDescription => _description;

  set setDescription(description) => _description = description ?? '';

  get getUrl => _url;

  set setUrl(url) => _url = url;

  get getImageUrl => _imageUrl;

  set setImageUrl(imageUrl) => _imageUrl = imageUrl;

  get getPubDate => _pubDate;

  set setPubDate(pubDate) => _pubDate = pubDate;

  get getContent => _content;

  set setContent(content) => _content = content;

  @override
  String toString() {
    return 'NewsModel(title: $_title, description: $_description, url: $_url, imageUrl: $_imageUrl, pubDate: $_pubDate, content: $_content)';
  }
}
