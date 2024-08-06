import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:s_template/data/models/album/album_model.dart';
import 'package:s_template/data/models/photo/photo_model.dart';
import 'package:s_template/presentation/provider/photo_provider.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({super.key, required this.album});

  final AlbumModel album;

  static const path = '/albumDetail';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photos = ref.watch(getPhotosProvider(album.id));
    return Scaffold(
      appBar: AppBar(
        title: Text(album.title),
      ),
      body: Column(
        children: [
          const Text("List Photo"),
          photos.when(
            data: (data) => renderData(data),
            error: (error, _) => Text(error.toString()),
            loading: () => const CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }

  Widget renderData(List<PhotoModel> photos) {
    return Expanded(
      child: ListView.builder(
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              photos[index].thumbnailUrl,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
            ),
            title: Text(photos[index].title),
          );
        },
      ),
    );
  }
}
