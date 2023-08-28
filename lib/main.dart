import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weight_graph_with_getx/Controller/page_controller.dart';

import 'Pages/homepage.dart';

void main() async {
  await GetStorage.init();
  Get.put(RecordController());
  Get.put(DateController());
  Get.put(WeightController());
  Get.put(Controller());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      title: "Weight Tracker",
      home: Home(),
    );
  }
}
