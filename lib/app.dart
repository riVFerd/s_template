import 'package:flutter/material.dart';
import 'package:s_template/presentation/router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Starter Template',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      routerConfig: AppRouter.router(),
    );
  }
}
