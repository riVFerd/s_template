import 'package:s_template/data/datasources/remote_datasources/base_remote_datasource.dart';

import '../../models/album/album_model.dart';

class AlbumRemoteDatasource extends BaseRemoteDatasource {
  AlbumRemoteDatasource(super.dio, super.session);
  
  Future<List<AlbumModel>> getAlbums() async {
    return networkRequest(request: (dio) {
      return dio.get('/albums');
    }, onResponse: (data) {
      (data as List<dynamic>?);
      if (data == null) return [];
      return data.map((e) => AlbumModel.fromJson(e)).toList();
    });
  }
}