import 'package:fpdart/fpdart.dart';
import 'package:s_template/common/errors/app_error.dart';
import 'package:s_template/data/datasources/remote_datasources/album_remote_datasource.dart';
import 'package:s_template/data/models/album/album_model.dart';
import 'package:s_template/data/repositories/repository.dart';
import 'package:s_template/injection.dart';

class AlbumRepository extends Repository {
  AlbumRepository(super.networkInfo);

  final albumRemote = locator<AlbumRemoteDatasource>();

  Future<Either<AppError, List<AlbumModel>>> getAlbums() {
    return handleNetworkCall(call: albumRemote.getAlbums(), onSuccess: (data) => data,);
  }
}