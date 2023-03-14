import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/core/utils/dimensions.dart';
import 'package:quran_app/core/widgets/custom_loader.dart';
import 'package:quran_app/futures/surah/domian/entities/details_surah.dart';
import 'package:quran_app/futures/surah/domian/entities/surah.dart';
import 'package:quran_app/futures/surah/presentatain/controller/home_controller.dart';

class DetailSurahScreen extends GetView<HomeController> {
  DetailSurahScreen({super.key});

  final Surah surah = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Surah ${surah.name.transliteration.id}",
          style: context.theme.textTheme.titleLarge,
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.origin,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.height10 - 2,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            GestureDetector(
              onTap: () => Get.defaultDialog(
                  radius: Dimensions.radius15,
                  backgroundColor: Get.isDarkMode
                      ? AppColors.backgroundLight.withOpacity(0.2)
                      : AppColors.backgroundDark.withOpacity(0.2),
                  title:
                      "TAFSIR ${surah.name.transliteration.id.toUpperCase()}",
                  titleStyle: context.theme.textTheme.titleLarge,
                  content: SizedBox(
                    child: Text(
                      surah.tafsir.id,
                      textAlign: TextAlign.justify,
                      style: context.theme.textTheme.titleSmall,
                    ),
                  )),
              child: Card(
                color: AppColors.origin,
                child: Stack(
                  children: [
                    const Positioned(
                      right: 0.0,
                      left: 0.0,
                      child: Image(
                        image: AssetImage(
                          AppString.quranAsset,
                        ),
                        fit: BoxFit.cover,
                        width: 200,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.origin.withOpacity(0.7),
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                      ),
                      width: double.infinity,
                      height: 270,
                    ),
                    Padding(
                      padding: EdgeInsets.all(Dimensions.height20),
                      child: Column(
                        children: [
                          Text(
                            surah.name.transliteration.id.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Dimensions.font26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: Dimensions.height10),
                          Text(
                            surah.name.translation.en.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Dimensions.font20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: Dimensions.height10 - 5),
                          const Divider(),
                          SizedBox(height: Dimensions.height10 - 5),
                          Text(
                            "${surah.numberOfVerses.toString()} Ayat | ${surah.revelation.id}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Dimensions.font16,
                            ),
                          ),
                          SizedBox(height: Dimensions.height10),
                          const Image(
                            image: AssetImage(
                              AppString.pesmalahAsset,
                            ),
                            fit: BoxFit.cover,
                            width: 250,
                            height: 100,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: Dimensions.height20),
            FutureBuilder<DetailSurah>(
                future: controller.getDetailSurah(surah.number.toString()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.verses.length,
                      itemBuilder: (context, index) {
                        Verse ayat = snapshot.data!.verses[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: Dimensions.height10 - 5,
                                  horizontal: Dimensions.height10,
                                ),
                                child: Row(children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image(
                                        image: const AssetImage(
                                          AppString.octagonalAsset,
                                        ),
                                        fit: BoxFit.cover,
                                        color: Get.isDarkMode
                                            ? Colors.white
                                            : AppColors.origin,
                                        height: 35,
                                        width: 35,
                                      ),
                                      Text(
                                        "${index + 1}",
                                        //style: context.theme.textTheme.titleSmall,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  GetBuilder<HomeController>(
                                    builder: (homeController) => Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Get.defaultDialog(
                                                radius: Dimensions.radius15,
                                                backgroundColor: Get.isDarkMode
                                                    ? AppColors.backgroundLight
                                                        .withOpacity(0.2)
                                                    : AppColors.backgroundDark
                                                        .withOpacity(0.2),
                                                title: "BOOKMARK",
                                                middleText: "add to book mark",
                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      homeController
                                                          .addBookmark(
                                                              true,
                                                              snapshot.data!,
                                                              ayat,
                                                              index);
                                                    },
                                                    child:
                                                        const Text('LAST READ'),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      homeController
                                                          .addBookmark(
                                                              false,
                                                              snapshot.data!,
                                                              ayat,
                                                              index);
                                                    },
                                                    child:
                                                        const Text('BOOKMARK'),
                                                  ),
                                                ]);
                                          },
                                          icon: Icon(
                                            Icons.bookmark_add_outlined,
                                            color: AppColors.origin,
                                          ),
                                        ),
                                        (ayat.audioStatus == "stop")
                                            ? IconButton(
                                                onPressed: () {
                                                  homeController
                                                      .playAudio(ayat);
                                                },
                                                icon: Icon(
                                                  Icons.play_arrow,
                                                  color: AppColors.origin,
                                                ),
                                              )
                                            : Row(
                                                children: [
                                                  (ayat.audioStatus == "playing")
                                                      ? IconButton(
                                                          onPressed: () {
                                                            homeController
                                                                .pauseAudio(
                                                                    ayat);
                                                          },
                                                          icon: Icon(
                                                            Icons.pause,
                                                            color: AppColors
                                                                .origin,
                                                          ),
                                                        )
                                                      : IconButton(
                                                          onPressed: () {
                                                            homeController
                                                                .resumeAudio(
                                                                    ayat);
                                                          },
                                                          icon: Icon(
                                                            Icons.play_arrow,
                                                            color: AppColors
                                                                .origin,
                                                          ),
                                                        ),
                                                  IconButton(
                                                    onPressed: () {
                                                      homeController
                                                          .stopAudio(ayat);
                                                    },
                                                    icon: Icon(
                                                      Icons.stop,
                                                      color: AppColors.origin,
                                                    ),
                                                  ),
                                                ],
                                              )
                                      ],
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            SizedBox(height: Dimensions.height20),
                            //////////////////////////////////////////////////////
                            ///padding
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                ayat.text.arab,
                                textAlign: TextAlign.end,
                                style: context.theme.textTheme.titleLarge!
                                    .copyWith(fontWeight: FontWeight.w300),
                              ),
                            ),
                            SizedBox(height: Dimensions.height20),
                            Text(
                              ayat.text.transliteration.en,
                              style:
                                  context.theme.textTheme.titleSmall!.copyWith(
                                fontSize: Dimensions.font20,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            SizedBox(height: Dimensions.height20),
                            const Divider(),
                            Text(
                              ayat.translation.en,
                              style: TextStyle(
                                fontSize: Dimensions.font16,
                                fontStyle: FontStyle.italic,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: Dimensions.height30),
                          ],
                        );
                      },
                    );
                  }
                  return const CustomLoader();
                }),
          ],
        ),
      ),
    );
  }
}
