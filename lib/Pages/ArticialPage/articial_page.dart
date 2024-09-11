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
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
            children: [
              SearchWidget(),
              SizedBox(height: 20),
              Obx(() => Column(
                    children: newsController.newsForYouList
                        .map((e) => NewsTile(
                            imageUrl: e.urlToImage ?? "",
                            title: e.title,
                            time: e.publishedAt.toString(),
                            author: e.author ?? "Unknown",
                            ontap: () {
                              Get.to(NewsDetailsPage(news: e));
                            }))
                        .toList(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
