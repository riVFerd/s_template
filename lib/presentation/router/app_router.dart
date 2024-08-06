import 'package:go_router/go_router.dart';
import 'package:s_template/presentation/screens/detail/detail_screen.dart';
import 'package:s_template/presentation/screens/home/home_screen.dart';

import '../../data/models/album/album_model.dart';

class AppRouter {
  static GoRouter router() {
    return GoRouter(
      routes: [
        GoRoute(
          path: HomeScreen.path,
          builder: (_, __) => const HomeScreen(),
        ),
        GoRoute(
          path: DetailScreen.path,
          builder: (context, state) {
            final album = state.extra as AlbumModel;
            return DetailScreen(album: album);
          },
        ),
      ],
    );
  }
}
