import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/futures/surah/presentatain/controller/home_controller.dart';

import '../../../../config/routes/app_pages.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_loader.dart';
import '../../domian/entities/surah.dart';

class SurahWidget extends GetView<HomeController> {
  const SurahWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Surah>>(
      future: controller.getAllSurah(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Surah surah = snapshot.data![index];
              return ListTile(
                onTap: () => Get.toNamed(Routes.detailSurah, arguments: surah),
                leading: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image(
                      image: const AssetImage(
                        AppString.octagonalAsset,
                      ),
                      fit: BoxFit.cover,
                      color: Get.isDarkMode ? Colors.white : AppColors.origin,
                      height: 35,
                      width: 35,
                    ),
                    Text(
                      "${index + 1}",
                      //style: context.theme.textTheme.titleSmall,
                    ),
                  ],
                ),
                title: Text(
                  surah.name.transliteration.en,
                  //style: context.theme.textTheme.titleSmall,
                ),
                subtitle: Text(
                  "${surah.numberOfVerses} Ayat ${surah.revelation.id}",
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                trailing: Text(
                  surah.name.short,
                  //style: context.theme.textTheme.titleSmall,
                ),
              );
            },
          );
        }
        return const CustomLoader();
      },
    );
  }
}
