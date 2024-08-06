import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:s_template/common/network/network_info.dart';
import 'package:s_template/common/storage/shared_pref_storage.dart';
import 'package:s_template/common/storage/storage.dart';
import 'package:s_template/common/network/api_service.dart';
import 'package:s_template/data/datasources/session/session_source.dart';

final locator = GetIt.instance;

void initializeDependencies() {
  locator.registerLazySingleton<Dio>(() => ApiService.dio());
  locator.registerSingleton<SharedPrefStorageInterface>(const SharedPrefStorage());
  locator.registerLazySingleton<Storage>(() => const Storage());
  locator.registerLazySingleton<SessionSource>(() => SessionSource(shared: locator.get()));
  locator.registerLazySingleton<Connectivity>(() => Connectivity());
  locator.registerLazySingleton(() => NetworkInfo(locator.get()));
  // Todo: Register all dependencies here
}
