import 'package:dartz/dartz.dart';
import 'package:quran_app/futures/surah/domian/entities/surah.dart';
import 'package:quran_app/futures/surah/domian/entities/details_surah.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domian/repository/home_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../datasources/home_remote_datasource.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  final NetworkInfo networkInfo;
  HomeRepositoryImpl(this.homeRemoteDataSource, this.networkInfo);
  
  @override
  Future<Either<Failure, List<Surah>>> getAllSurah() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await homeRemoteDataSource.getAllSurah();
        return right(result);
      } on ServerException catch (failure) {
        return left(ServerFailure(message: failure.messageError));
      }
    } else {
      return left(const OfflineFailure(message: "Offline failure"));
    }
  }

  @override
  Future<Either<Failure, DetailSurah>> getDetailSurah(String surahId) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await homeRemoteDataSource.getDetailSurah(surahId);
        return right(result);
      } on ServerException catch (failure) {
        return left(ServerFailure(message: failure.messageError));
      }
    } else {
      return left(const OfflineFailure(message: "Offline failure"));
    }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getAllJuz() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await homeRemoteDataSource.getAllJuz();
        return right(result);
      } on ServerException catch (failure) {
        return left(ServerFailure(message: failure.messageError));
      }
    } else {
      return left(const OfflineFailure(message: "Offline failure"));
    }
  }
}