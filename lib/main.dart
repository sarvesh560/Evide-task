import 'package:busstoptracker/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'extensions/screen_util_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtilHelper.init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Evide Takehome",
      home: HomeView(),
    );
  }
}
