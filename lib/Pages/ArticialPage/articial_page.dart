import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/Controller/News_controller.dart';
import 'package:newapp/Pages/ArticialPage/Widgets/search_widget.dart';
import 'package:newapp/Pages/NewsDetail/news_details.dart';
import 'package:newapp/Pages/widgets/news_tile.dart';

class ArticalPage extends StatelessWidget {
  const ArticalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.find<NewsController>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(),
              const SizedBox(height: 20),
              Obx(() {
                if (newsController.newsForYouList.isEmpty) {
                  return Center(child: Text('No news available.'));
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: newsController.newsForYouList.length,
                    itemBuilder: (context, index) {
                      final newsItem = newsController.newsForYouList[index];
                      return NewsTile(
                        imageUrl: newsItem.urlToImage ??
                            "", // Default to empty string if null
                        title: newsItem.title ??
                            "No title", // Default to "No title" if null
                        time: newsItem.publishedAt?.toLocal().toString() ??
                            "Unknown time", // Format date if not null
                        author: newsItem.author ??
                            "Unknown", // Default to "Unknown" if null
                        ontap: () {
                          Get.to(NewsDetailsPage(news: newsItem));
                        },
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
