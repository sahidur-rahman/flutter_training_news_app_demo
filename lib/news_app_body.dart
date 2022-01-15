import 'package:flutter/material.dart';
import 'package:news_app/constant.dart';
import 'package:news_app/news_detail.dart';
import 'package:news_app/news_service.dart';

class NewsAppBody extends StatefulWidget {
  const NewsAppBody({Key? key}) : super(key: key);

  @override
  _NewsAppBodyState createState() => _NewsAppBodyState();
}

class _NewsAppBodyState extends State<NewsAppBody> {
  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      //color: Colors.greenAccent,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 65,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: TextField(
              textAlign: TextAlign.left,
              maxLines: 1,
              expands: false,
              autofocus: false,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                fetchNews(value);
              },
              decoration: InputDecoration(
                hintText: 'Keyword for search',
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.black)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.all(4),
            alignment: Alignment.centerLeft,
            child: ListView.separated(
                separatorBuilder: (_, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemCount: category.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: activeCategoryIndex == index
                              ? Colors.lime
                              : Colors.white,
                          shape: StadiumBorder()),
                      onPressed: () {
                        activeCategoryIndex = index;
                        fetchNews();
                      },
                      child: Text(category[index]));
                }),
          ),
          /* Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
            child: Text(
              'Latest news',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500),
            ),
          ), */
          Expanded(
            child: newsList.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext) {
                                return NewsDetail(
                                  index: index,
                                );
                              },
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            color: Colors.transparent,
                            elevation: 15,
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              height: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                fit: StackFit.passthrough,
                                children: [
                                  Image.network(
                                    newsList[index].getImageUrl.toString(),
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.blueAccent,
                                          Colors.black.withOpacity(0),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        newsList[index].getTitle,
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, index) => Container(
                          color: Colors.limeAccent,
                          //child: const Text('Seperator'),
                        ),
                    itemCount: newsList.length)
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ],
      ),
    );
  }

  fetchNews([String? keyword]) async {
    newsList.clear();
    setState(() {});
    print('Fetch news called');
    NewsService newsService = NewsService();
    if (keyword == null) {
      await newsService.getNews();
    } else {
      await newsService.getNews(keyword);
    }

    print("Newses gated");
    setState(() {});
    //newsService.loadNews();
  }
}
