import 'package:flutter/material.dart';
import 'package:s_template/app.dart';
import 'package:s_template/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(const App());
}
