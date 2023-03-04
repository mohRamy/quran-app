import 'package:dartz/dartz.dart';
import 'package:quran_app/core/error/failures.dart';
import 'package:quran_app/futures/surah/domian/entities/details_surah.dart';
import 'package:quran_app/futures/surah/domian/entities/surah.dart';

abstract class HomeRepository{
  Future<Either<Failure, List<Surah>>> getAllSurah();
  Future<Either<Failure, DetailSurah>> getDetailSurah(String surahId);
}