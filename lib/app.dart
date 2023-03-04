import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/routes/app_pages.dart';

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quran App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.introduction,
      getPages: AppPages.routes,
    );
  }
}
