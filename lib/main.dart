import 'package:flutter/material.dart';
import 'package:watamuki/src/App.dart';
import 'package:watamuki/src/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(const App());
}
