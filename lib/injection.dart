import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:s_template/common/network/network_info.dart';
import 'package:s_template/common/storage/shared_pref_storage.dart';
import 'package:s_template/common/storage/storage.dart';
import 'package:s_template/common/network/api_service.dart';
import 'package:s_template/data/datasources/remote_datasources/album_remote_datasource.dart';
import 'package:s_template/data/datasources/session/session_source.dart';
import 'package:s_template/data/repositories/album_repository.dart';

import 'data/datasources/remote_datasources/photo_remote_datasource.dart';
import 'data/repositories/photo_repository.dart';

final locator = GetIt.instance;

void initializeDependencies() {
  locator.registerLazySingleton<Dio>(() => ApiService.dio());
  locator.registerSingleton<SharedPrefStorageInterface>(const SharedPrefStorage());
  locator.registerLazySingleton<Storage>(() => const Storage());
  locator.registerLazySingleton<SessionSource>(() => SessionSource(shared: locator.get()));
  locator.registerLazySingleton<Connectivity>(() => Connectivity());
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfo(locator.get()));
  locator.registerLazySingleton<AlbumRemoteDatasource>(() => AlbumRemoteDatasource(locator.get(), locator.get()));
  locator.registerLazySingleton<PhotoRemoteDatasource>(() => PhotoRemoteDatasource(locator.get(), locator.get()));
  locator.registerLazySingleton<AlbumRepository>(() => AlbumRepository(locator.get()));
  locator.registerLazySingleton<PhotoRepository>(() => PhotoRepository(locator.get()));
  // Todo: Register all dependencies here
}
