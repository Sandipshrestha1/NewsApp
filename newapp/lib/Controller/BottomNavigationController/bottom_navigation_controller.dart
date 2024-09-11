import 'package:get/get.dart';
import 'package:newapp/Pages/ArticialPage/articial_page.dart';
import 'package:newapp/Pages/HomePage/home_page.dart';
import 'package:newapp/Pages/Profile/profile_page.dart';

class BottomNavController extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    HomePage(),
    ArticalPage(),
    ProfilePage(),
  ];
}
