import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/Controller/News_controller.dart';
import 'package:newapp/Pages/NewsDetail/news_details.dart';
import '../widgets/news_tile.dart';
import '../widgets/tranding_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),

              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(Icons.dashboard),
                  ),
                  Text(
                    "NEWS APP",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      newsController.trendingNewsList();
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(Icons.person),
                    ),
                  ),
                ],
              ),

              // Hottest News Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hottest News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Trending News Horizontal Scroll
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => newsController.istrendingNewsListLoading.value
                      ? CircularProgressIndicator()
                      : newsController.trendingNewsList.isNotEmpty
                          ? Row(
                              children: newsController.trendingNewsList
                                  .map(
                                    (e) => TrandingCard(
                                      ontap: () {
                                        Get.to(() => NewsDetailsPage(news: e));
                                      },
                                      imageUrl: e.urlToImage ??
                                          "https://imgs.search.brave.com/3iJVbYB2lmqynToA4f0fFWKxfun18j-ypAnXpCZpBJE/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAyLzE5LzE1Lzg5/LzM2MF9GXzIxOTE1/ODk2OV9rdjJzN1JF/cTZBN2FyWDZuOVRY/NnR0Nkg5Zzd1dWpZ/VS5qcGc",
                                      tag: "Trending No: 1",
                                      time: e.publishedAt.toString(),
                                      title: e.title,
                                      author: e.author ?? "Unknown",
                                    ),
                                  )
                                  .toList(),
                            )
                          : Center(child: Text("No trending news available.")),
                ),
              ),
              SizedBox(height: 20),

              // News for You Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News for you",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              SizedBox(height: 20),

              // News for You List
              Obx(
                () => newsController.isnewsForYouListListLoading.value
                    ? CircularProgressIndicator()
                    : newsController.fiveNewsOnly.isNotEmpty
                        ? Column(
                            children: newsController.fiveNewsOnly
                                .map((e) => NewsTile(
                                      ontap: () {
                                        Get.to(() => NewsDetailsPage(news: e));
                                      },
                                      imageUrl: e.urlToImage ??
                                          "https://via.placeholder.com/150",
                                      title: e.title,
                                      time: e.publishedAt.toString(),
                                      author: e.author ?? "Unknown",
                                    ))
                                .toList(),
                          )
                        : Center(child: Text("No news available for you.")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
