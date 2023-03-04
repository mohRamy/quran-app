import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/widgets/widgets.dart';
import 'package:quran_app/futures/surah/domian/entities/surah.dart';
import 'package:quran_app/futures/surah/presentatain/controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Surah>>(
        future: controller.getAllSurah(),
        builder: (context, snapshot) {
          return snapshot.hasData
          ? ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Surah surah = snapshot.data![index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text("${index + 1}"),
                ),
                title: Text(surah.name.transliteration.en),
                subtitle: Text("${surah.numberOfVerses} Ayat ${surah.revelation.id}"),
                trailing: Text(surah.name.short),


              );
            },
          ): const CustomShimmer();
        }
      )
    );
  }
}