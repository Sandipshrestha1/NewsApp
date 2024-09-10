import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:newapp/Controller/BottomNavigationController/bottom_navigation_controller.dart';

class MyButtonNav extends StatelessWidget {
  const MyButtonNav({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: 200,
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                controller.index.value = 0;
              },
              child: Obx(
                () => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: controller.index.value == 0
                        ? Theme.of(context).colorScheme.primary
                        : null,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    Icons.home,
                    size: 25,
                    color: controller.index.value == 0
                        ? Theme.of(context).colorScheme.onSurface
                        : Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                controller.index.value = 1;
              },
              child: Obx(
                () => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: controller.index.value == 1
                        ? Theme.of(context).colorScheme.primary
                        : null,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    Icons.book,
                    size: 25,
                    color: controller.index.value == 1
                        ? Theme.of(context).colorScheme.onSurface
                        : Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                controller.index.value = 2;
              },
              child: Obx(
                () => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: controller.index.value == 2
                        ? Theme.of(context).colorScheme.primary
                        : null,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    Icons.settings,
                    size: 25,
                    color: controller.index.value == 2
                        ? Theme.of(context).colorScheme.onSurface
                        : Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
