import 'package:s_template/data/datasources/remote_datasources/remote_datasource.dart';
import 'package:s_template/data/models/photo/photo_model.dart';

class PhotoRemoteDatasource extends RemoteDatasource {
  PhotoRemoteDatasource(super.dio, super.session);

  Future<List<PhotoModel>> getPhotos(int albumId) async {
    return networkRequest(
      request: (dio) => dio.get('/photos?albumId=$albumId'),
      onResponse: (data) {
        (data as List<dynamic>?);
        if (data == null) return [];
        return data.map((e) => PhotoModel.fromJson(e)).toList();
      },
    );
  }
}
