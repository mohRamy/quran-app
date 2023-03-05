import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/config/routes/app_pages.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/widgets/custom_loader.dart';
import 'package:quran_app/core/widgets/widgets.dart';
import 'package:quran_app/futures/surah/domian/entities/surah.dart';
import 'package:quran_app/futures/surah/presentatain/controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Quran App",
            style: context.theme.textTheme.titleLarge,
          ),
          leading: Icon(
            Icons.menu,
            color: AppColors.branch,
          ),
          actions: [
            Icon(
              Icons.search,
              color: AppColors.branch,
            ),
          ],
        ),
        body: FutureBuilder<List<Surah>>(
            future: controller.getAllSurah(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Surah surah = snapshot.data![index];
                    return ListTile(
                      onTap: () =>
                          Get.toNamed(Routes.detailSurah, arguments: surah),
                      leading: CircleAvatar(
                        backgroundColor: Get.isDarkMode ? AppColors.origin : AppColors.branch,
                        child: Text(
                          "${index + 1}",
                        ),
                      ),
                      title: Text(
                        surah.name.transliteration.en,
                        style: context.theme.textTheme.titleSmall,
                      ),
                      subtitle: Text(
                        "${surah.numberOfVerses} Ayat ${surah.revelation.id}",
                        style: context.theme.textTheme.titleSmall,
                      ),
                      trailing: Text(
                        surah.name.short,
                        style: context.theme.textTheme.titleSmall,
                      ),
                    );
                  },
                );
              }
              return const CustomLoader();
            }));
  }
}
