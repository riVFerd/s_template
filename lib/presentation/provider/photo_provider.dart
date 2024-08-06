import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:s_template/data/models/photo/photo_model.dart';
import 'package:s_template/data/repositories/photo_repository.dart';
import 'package:s_template/injection.dart';

part 'photo_provider.g.dart';

@riverpod
Future<List<PhotoModel>> getPhotos(GetPhotosRef ref, int albumId) async {
  final data = await locator<PhotoRepository>().getPhotos(albumId);
  return data.fold(
    (l) => throw l,
    (r) => r,
  );
}