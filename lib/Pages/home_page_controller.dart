import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/Components/NavigationBar/navigation_bar.dart';
import 'package:newapp/Controller/BottomNavigationController/bottom_navigation_controller.dart';

class HomePageController extends StatelessWidget {
  const HomePageController({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());
    return Scaffold(
      floatingActionButton: MyButtonNav(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Obx(
        () => controller.pages[controller.index.value],
      ),
    );
  }
}
