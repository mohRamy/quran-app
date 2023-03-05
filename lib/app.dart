import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/utils/app_colors.dart';

import 'config/routes/app_pages.dart';
import 'config/themes/theme_services.dart';

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quran App',
      theme: Themes.light,
      themeMode: ModeTheme().theme,
      // ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: AppColors.origin),
      //   useMaterial3: true,
      // ),
      initialRoute: Routes.introduction,
      getPages: AppPages.routes,
    );
  }
}
