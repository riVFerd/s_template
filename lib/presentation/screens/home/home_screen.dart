import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:s_template/data/models/album/album_model.dart';
import 'package:s_template/presentation/provider/album_provider.dart';
import 'package:s_template/presentation/screens/detail/detail_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const path = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumList = ref.watch(albumProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          const Text('List Album'),
          albumList.when(
            data: (data) => renderData(data),
            error: (error, _) => Text(error.toString()),
            loading: () => const CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }

  Widget renderData(List<AlbumModel> albumList) {
    return Expanded(
      child: ListView.builder(
        itemCount: albumList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => context.push(DetailScreen.path, extra: albumList[index]),
            title: Text(albumList[index].title),
          );
        },
      ),
    );
  }
}
