import 'package:flutter/material.dart';
import 'package:newapp/Components/NavigationBar/navigation_bar.dart';

import 'widgets/news_tile.dart';
import 'widgets/tranding_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News Seekers",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      floatingActionButton: MyButtonNav(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
              SizedBox(
                height: 20,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TrandingCard(
                      imageUrl:
                          "https://imgs.search.brave.com/3iJVbYB2lmqynToA4f0fFWKxfun18j-ypAnXpCZpBJE/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAyLzE5LzE1Lzg5/LzM2MF9GXzIxOTE1/ODk2OV9rdjJzN1JF/cTZBN2FyWDZuOVRY/NnR0Nkg5Zzd1dWpZ/VS5qcGc",
                      title: "Save water for future",
                      author: "Sandip shrestha",
                      tag: "Tranding no 1",
                      time: "2 days ago",
                    ),
                    TrandingCard(
                      imageUrl:
                          "https://imgs.search.brave.com/ItiCqVcGF90vFXj-UR-xkVUn5RsuxqFqwthDkUDwwbw/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvNTA1/NDk2OTYyL3Bob3Rv/L2ZyZXNoLWdyZWVu/LWxlYXZlcy5qcGc_/cz02MTJ4NjEyJnc9/MCZrPTIwJmM9Y1R6/djUtNzc3bDh4TXRv/OW40dXhtMjVtU0Jw/Rlc2RThaQ1NpWnZL/UGRlND0",
                      title: "Spring Season",
                      author: " shrestha",
                      tag: "Tranding no 2",
                      time: "1 days ago",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  NewsTile(
                    imageUrl:
                        "https://imgs.search.brave.com/3iJVbYB2lmqynToA4f0fFWKxfun18j-ypAnXpCZpBJE/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAyLzE5LzE1Lzg5/LzM2MF9GXzIxOTE1/ODk2OV9rdjJzN1JF/cTZBN2FyWDZuOVRY/NnR0Nkg5Zzd1dWpZ/VS5qcGc",
                    title: "Save water for future",
                    author: "Sandip shrestha",
                    time: "2 days ago",
                  ),
                  NewsTile(
                    imageUrl:
                        "https://imgs.search.brave.com/ItiCqVcGF90vFXj-UR-xkVUn5RsuxqFqwthDkUDwwbw/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvNTA1/NDk2OTYyL3Bob3Rv/L2ZyZXNoLWdyZWVu/LWxlYXZlcy5qcGc_/cz02MTJ4NjEyJnc9/MCZrPTIwJmM9Y1R6/djUtNzc3bDh4TXRv/OW40dXhtMjVtU0Jw/Rlc2RThaQ1NpWnZL/UGRlND0",
                    title: "Spring Season",
                    author: " shrestha",
                    time: "1 days ago",
                  ),
                  NewsTile(
                    imageUrl:
                        "https://imgs.search.brave.com/3iJVbYB2lmqynToA4f0fFWKxfun18j-ypAnXpCZpBJE/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAyLzE5LzE1Lzg5/LzM2MF9GXzIxOTE1/ODk2OV9rdjJzN1JF/cTZBN2FyWDZuOVRY/NnR0Nkg5Zzd1dWpZ/VS5qcGc",
                    title: "Save water for future",
                    author: "Sandip shrestha",
                    time: "2 days ago",
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
