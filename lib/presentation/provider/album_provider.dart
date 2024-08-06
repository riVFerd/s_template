import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:s_template/data/repositories/album_repository.dart';
import 'package:s_template/injection.dart';

import '../../data/models/album/album_model.dart';

part 'album_provider.g.dart';

@riverpod
class Album extends _$Album {
  final albumRepo = locator<AlbumRepository>();

  @override
  FutureOr<List<AlbumModel>> build() {
    getAlbums();
    return [];
  }

  Future<void> getAlbums() async {
    state = const AsyncValue.loading();
    final data = await albumRepo.getAlbums();
    state = data.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
  }
}
