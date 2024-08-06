import 'package:fpdart/fpdart.dart';
import 'package:s_template/common/errors/app_error.dart';
import 'package:s_template/data/datasources/remote_datasources/photo_remote_datasource.dart';
import 'package:s_template/data/models/photo/photo_model.dart';
import 'package:s_template/data/repositories/base_repository.dart';
import 'package:s_template/injection.dart';

class PhotoRepository extends BaseRepository {
  PhotoRepository(super.networkInfo);

  final photoRemote = locator<PhotoRemoteDatasource>();

  Future<Either<AppError, List<PhotoModel>>> getPhotos(int albumId) async {
    return handleNetworkCall(
      call: photoRemote.getPhotos(albumId),
      onSuccess: (data) => data,
    );
  }
}
