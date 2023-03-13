import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:get/get.dart';
import 'package:quran_app/futures/surah/data/repository/home_repository_impl.dart';
import 'package:quran_app/futures/surah/domian/repository/home_repository.dart';
import 'package:quran_app/futures/surah/domian/usecases/get_all_surah.dart';
import 'package:quran_app/futures/surah/domian/usecases/get_detail_surah.dart';
import 'package:quran_app/futures/surah/domian/usecases/get_all_juz.dart';
import 'package:quran_app/futures/surah/presentatain/controller/home_controller.dart';
import '../core/network/api_constance.dart';

import '../core/network/api_client.dart';
import '../core/network/network_info.dart';
import '../futures/surah/data/datasources/home_remote_datasource.dart';

Future<void> init() async {
  // get storage
  Get.lazyPut(() => GetStorage());

  // api client
  Get.lazyPut(
      () => ApiClient(box: Get.find()));

  // netInfo
  Get.lazyPut<NetworkInfo>(() => NetworkInfoImpl(Get.find()));
  Get.lazyPut(() => InternetConnectionChecker());

  // base and impl
  Get.lazyPut<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(Get.find()));
  Get.lazyPut<HomeRepository>(() => HomeRepositoryImpl(Get.find(), Get.find()));

  //controllers
  Get.lazyPut(() => GetAllSurahUsecase(Get.find()));
  Get.lazyPut(() => GetDetailSurahUsecase(Get.find()));
  Get.lazyPut(() => GetAllJuzUsecase(Get.find()));
  Get.lazyPut(
    () => HomeController(
      getAllSurahUsecase: Get.find(),
      getDetailSurahUsecase: Get.find(),
      getAllJuzUsecase: Get.find(),
    ),
  );
}
