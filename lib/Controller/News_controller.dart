import 'dart:convert';
import 'package:get/get.dart'; // To manage RxList and GetxController
import 'package:http/http.dart' as http;
import 'package:newapp/Model/NewsModel.dart';

class NewsController extends GetxController {
  RxList<NewsModel> trendingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYouList = <NewsModel>[].obs;
  RxList<NewsModel> fiveNewsOnly = <NewsModel>[].obs;
  RxBool istrendingNewsListLoading = false.obs;
  RxBool isnewsForYouListListLoading = false.obs;
  RxBool isfiveNewsOnlyListLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getTrendingNews();
    getNewsForYou();
  }

  Future<void> getTrendingNews() async {
    istrendingNewsListLoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=d58be314b71d4ea3a16a26e0b73ae0a0";

    try {
      var response = await http.get(Uri.parse(baseURL));

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body['articles'];

        for (var news in articles) {
          trendingNewsList.add(NewsModel.fromJson(news));
        }

        print(trendingNewsList);
      } else {
        print(
            'Failed to load trending news. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while fetching trending news: $e');
    } finally {
      istrendingNewsListLoading.value = false;
    }
  }

  Future<void> getNewsForYou() async {
    isnewsForYouListListLoading.value = true;

    var baseURL =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=d58be314b71d4ea3a16a26e0b73ae0a0";

    try {
      var response = await http.get(Uri.parse(baseURL));

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body['articles'];

        newsForYouList.clear(); // Clear old data before adding new data
        for (var news in articles) {
          newsForYouList.add(NewsModel.fromJson(news));
        }

        if (newsForYouList.length >= 5) {
          fiveNewsOnly.value = newsForYouList.sublist(0, 5).obs;
        } else {
          fiveNewsOnly.value = newsForYouList.obs as List<NewsModel>;
        }

        print(newsForYouList);
      } else {
        print(
            'Failed to load news for you. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while fetching news for you: $e');
    } finally {
      isnewsForYouListListLoading.value = false;
    }
  }

  Future<void> searchNews(String search) async {
    isnewsForYouListListLoading.value = true;

    var baseURL =
        "https://newsapi.org/v2/top-headlines?q=$search&apiKey=d58be314b71d4ea3a16a26e0b73ae0a0";

    try {
      var response = await http.get(Uri.parse(baseURL));

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body['articles'];

        newsForYouList.clear(); // Clear old search results

        int i = 0;
        for (var news in articles) {
          i++;
          newsForYouList.add(NewsModel.fromJson(news));

          if (i == 10) {
            break; // Stop after adding 10 articles
          }
        }
      } else {
        print('Failed to search news. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while searching news: $e');
    } finally {
      isnewsForYouListListLoading.value = false;
    }
  }
}
