import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/futures/surah/data/db/bookmark.dart';

import 'package:quran_app/futures/surah/domian/entities/details_surah.dart';
import 'package:quran_app/futures/surah/domian/entities/surah.dart';
import 'package:quran_app/futures/surah/domian/usecases/get_all_surah.dart';
import 'package:quran_app/futures/surah/domian/usecases/get_detail_surah.dart';
import 'package:quran_app/futures/surah/domian/usecases/get_all_juz.dart';

import 'package:sqflite/sqflite.dart';

import '../../../../core/utils/app_components.dart';

class HomeController extends GetxController {
  final GetAllSurahUsecase getAllSurahUsecase;
  final GetDetailSurahUsecase getDetailSurahUsecase;
  final GetAllJuzUsecase getAllJuzUsecase;

  HomeController({
    required this.getAllSurahUsecase,
    required this.getDetailSurahUsecase,
    required this.getAllJuzUsecase,
  });

  List<Surah> allSurah = [];

  Future<List<Surah>> getAllSurah() async {
    final result = await getAllSurahUsecase();
    result.fold(
      (l) => AppComponents.snackBar(l.message),
      (r) => allSurah = r,
    );
    update();
    return allSurah;
  }

  Future<DetailSurah> getDetailSurah(String surahId) async {
    final result = await getDetailSurahUsecase(surahId);
    late DetailSurah detailSurah;
    result.fold(
      (l) => AppComponents.snackBar(l.message),
      (r) => detailSurah = r,
    );
    update();
    return detailSurah;
  }

  Future<List<Map<String, dynamic>>> getAllJuz() async {
    final result = await getAllJuzUsecase();
    late List<Map<String, dynamic>> detailSurah;
    result.fold(
      (l) => AppComponents.snackBar(l.message),
      (r) => detailSurah = r,
    );
    update();
    return detailSurah;
  }

  DataBaseManager dataBase = DataBaseManager.instance;

  void addBookmark(
      bool lastRead, DetailSurah surah, Verse ayat, int indexAyat) async {
    Database db = await dataBase.db;

    bool flagExist = false;

    if (lastRead == true) {
      await db.delete("bookmark", where: "last_read = 1");
    } else {
      List checkData = await db.query("bookmark",
          where:
              "surah = '${surah.name.transliteration.id}' and ayat = ${ayat.number.inSurah} and juz = ${ayat.meta.juz} and via = 'surah' and index_ayat = $indexAyat and last_read = 0");

      if (checkData.isNotEmpty) {
        flagExist = true;
      }
    }

    if (flagExist == false) {
      await db.insert("bookmark", {
        "surah": surah.name.transliteration.id,
        "ayat": ayat.number.inSurah,
        "juz": ayat.meta.juz,
        "via": "surah",
        "index_ayat": indexAyat,
        "last_read": lastRead == true ? 1 : 0,
      });
      Get.back();
      AppComponents.snackBar(
        "Saved successfully",
        title: "Local Storage",
        color: Colors.green,
      );
    } else {
      Get.back();
      AppComponents.snackBar(
        "It's aready in bookmark",
        title: "Local Storage",
        color: Colors.yellow,
      );
    }
  }

  Future<List<Map<String, dynamic>>> getBookmark() async {
    Database db = await dataBase.db;
    List<Map<String, dynamic>> allBookmarks = await db.query(
      "bookmark",
      where: "last_read = 0",
    );
    return allBookmarks;
  }

  final player = AudioPlayer();
  Verse? lastVerse;

  void playAudio(Verse ayat) async {
    try {
      lastVerse ??= ayat;
      lastVerse!.audioStatus = "stop";
      lastVerse = ayat;
      lastVerse!.audioStatus = "stop";
      update();
      await player.stop();
      await player.setUrl(ayat.audio.primary);
      await player.play();
      ayat.audioStatus = "playing";
      update();
      await player.stop();
      ayat.audioStatus = "stop";
      update();
    } catch (e) {
      print("null");
    }
  }

  void pauseAudio(Verse ayat) async {
    try {
      await player.pause();
      ayat.audioStatus = "pause";
      update();
    } catch (e) {
      print("null");
    }
  }

  void resumeAudio(Verse ayat) async {
    try {
      await player.play();
      ayat.audioStatus = "playing";
      update();
      ayat.audioStatus = "stop";
      update();
    } catch (e) {
      print("null");
    }
  }

  void stopAudio(Verse ayat) async {
    try {
      await player.stop();
      ayat.audioStatus = "stop";
      update();
    } catch (e) {
      print("null");
    }
  }

  @override
  void onClose() {
    player.stop();
    player.dispose();
    super.onClose();
  }
}
