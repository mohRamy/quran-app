import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/utils/app_colors.dart';
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
          children: [
            Card(
              color: AppColors.origin,
              child: Padding(
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
                        DetailSurah detailSurah = snapshot.data!;
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
                                  CircleAvatar(
                                    backgroundColor: AppColors.origin,
                                    child: Text("${index + 1}"),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.bookmark_add_outlined,
                                      color: AppColors.origin,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.play_arrow,
                                      color: AppColors.origin,
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            SizedBox(height: Dimensions.height20),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                detailSurah.verses[index].text.arab,
                                textAlign: TextAlign.end,
                                style: context.theme.textTheme.titleSmall!
                                    .copyWith(
                                  fontSize: Dimensions.font26,
                                ),
                              ),
                            ),
                            SizedBox(height: Dimensions.height20),
                            Text(
                              detailSurah.verses[index].text.transliteration.en,
                              style:
                                  context.theme.textTheme.titleSmall!.copyWith(
                                fontSize: Dimensions.font20,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            SizedBox(height: Dimensions.height20),
                            const Divider(),
                            Text(
                              detailSurah.verses[index].translation.en,
                              style:
                                  context.theme.textTheme.titleSmall!.copyWith(
                                fontSize: Dimensions.font16,
                                fontStyle: FontStyle.italic,
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
