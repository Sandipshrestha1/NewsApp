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

  void onInit() async {
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
        var articles = body['articles']; // Corrected spelling

        for (var news in articles) {
          trendingNewsList.add(NewsModel.fromJson(news));
        }

        print(trendingNewsList);
      } else {
        print('Failed to load news. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while fetching news: $e');
    }
    istrendingNewsListLoading.value = false;
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

        for (var news in articles) {
          newsForYouList.add(NewsModel.fromJson(news));
        }
        fiveNewsOnly.value = newsForYouList.sublist(0, 5).obs;

        print(newsForYouList);
      } else {
        print('Failed to load news. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while fetching news: $e');
    }
    isnewsForYouListListLoading.value = true;
  }

  Future<void> searchNews(String search) async {
    isnewsForYouListListLoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/top-headlines?q=$search&apiKey=d58be314b71d4ea3a16a26e0b73ae0a0";
    //"https://newsapi.org/v2/everything?q=$search&apiKey=d58be314b71d4ea3a16a26e0b73ae0a0";

    try {
      var response = await http.get(Uri.parse(baseURL));

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body['articles'];
        newsForYouList.clear();
        int i = 0;
        for (var news in articles) {
          i++;
          newsForYouList.add(NewsModel.fromJson(news));

          if (i == 10) {
            break;
          }
        }
      } else {
        print('Failed to search news. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while fetching news: $e');
    }
    isnewsForYouListListLoading.value = false;
  }
}
