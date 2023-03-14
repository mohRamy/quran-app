import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/config/routes/app_pages.dart';
import 'package:quran_app/futures/surah/domian/entities/details_surah.dart';
import 'package:quran_app/futures/surah/presentatain/controller/home_controller.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_loader.dart';

class JuzWidget extends GetView<HomeController> {
  const JuzWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: controller.getAllJuz(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              Map<String, dynamic> dataMapPerJuz = snapshot.data![index];

              return ListTile(
                onTap: () =>
                    Get.toNamed(Routes.detailJuz, arguments: dataMapPerJuz),
                leading: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image(
                      image: const AssetImage(
                        AppString.octagonalAsset,
                      ),
                      fit: BoxFit.cover,
                      color: AppColors.origin,
                      height: 35,
                      width: 35,
                    ),
                    Text(
                      "${index + 1}",
                      // style: context.theme.textTheme.titleSmall,
                    ),
                  ],
                ),
                title: Text(
                  "Juz ${index + 1}",
                  // style: context.theme.textTheme.titleSmall,
                ),
                isThreeLine: true,
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Start Surah ${(dataMapPerJuz["start"]["surah"] as DetailSurah).name.transliteration.id} | ayat ${(dataMapPerJuz["start"]["ayat"] as Verse).number.inSurah}",
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "Start Surah ${(dataMapPerJuz["end"]["surah"] as DetailSurah).name.transliteration.id} | ayat ${(dataMapPerJuz["end"]["ayat"] as Verse).number.inSurah}",
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
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
