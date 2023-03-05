import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran_app/futures/surah/data/models/details_surah_model.dart';
import 'package:quran_app/futures/surah/data/models/surah_model.dart';
import 'package:quran_app/futures/surah/domian/entities/details_surah.dart';
import 'package:quran_app/futures/surah/domian/entities/surah.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_constance.dart';
import '../../../../core/utils/constants/state_handle.dart';

abstract class HomeRemoteDataSource {
  Future<List<Surah>> getAllSurah();
  Future<DetailSurah> getDetailSurah(String surahId);
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiClient apiClient;
  HomeRemoteDataSourceImpl(
    this.apiClient,
  );
  
  @override
  Future<List<Surah>> getAllSurah() async {
    http.Response res = await apiClient.getData(
      ApiConstance.allSurah,
    );
    List<Surah> allsurah = [];
    stateErrorHandle(
      res: res,
      onSuccess: () {
        for (var i = 0; i < jsonDecode(res.body)["data"].length; i++) {
          allsurah.add(
            SurahModel.fromJson(
                jsonDecode(
                  res.body,
                )["data"][i],
              ),
          );
        }
      },
    );
    return allsurah;
  }
  
  @override
  Future<DetailSurah> getDetailSurah(String surahId) async {
    http.Response res = await apiClient.getData(
      "${ApiConstance.detailsSurah}$surahId",
    );
    late DetailSurah detailSurah;
    stateErrorHandle(
      res: res,
      onSuccess: () {
          detailSurah = 
            DetailSurahModel.fromJson(
                jsonDecode(
                  res.body,
                )["data"],
          );
        }
    );
    return detailSurah;
  }
}