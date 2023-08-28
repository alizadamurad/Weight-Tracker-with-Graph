import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:weight_graph_with_getx/Controller/page_controller.dart';
import 'package:weight_graph_with_getx/Pages/graph_page.dart';
import 'package:weight_graph_with_getx/Pages/history_page.dart';
import '../components/bottom_nav_bar.dart';
import '../components/floating_action_button.dart';

class Home extends StatelessWidget {
  final Controller pageInfo = Get.find();
  @override
  Widget build(context) => Obx(
        () => Scaffold(
          extendBody: true,
          body: pageInfo.currentTab == 0 ? GraphPage() : HistoryPage(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingButton(),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(left: 7, right: 7, bottom: 10),
            child: BottomNavBar(),
          ),
        ),
      );
}
