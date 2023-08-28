import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_graph_with_getx/Controller/page_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pageController = Get.find<Controller>();

    return Container(
        height: 72,
        width: Get.width * 0.95,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xff248359),
            width: 0.8,
          ),
          gradient: LinearGradient(
            colors: [
              Color(0xff82f4b1),
              Color(0xff30c67c),
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Obx(
                () => IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    pageController.changeTab(0);
                  },
                  icon: Icon(
                    Icons.query_stats,
                    size: pageController.currentTab == 0 ? 40 : 30,
                    color: pageController.currentTab == 0
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    pageController.changeTab(1);
                  },
                  icon: Icon(
                    Icons.history,
                    size: pageController.currentTab == 1 ? 40 : 30,
                    color: pageController.currentTab == 1
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
