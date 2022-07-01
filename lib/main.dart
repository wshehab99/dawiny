import 'package:find_doctor/dawiny/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initialize();
  runApp(const Dawiny());
  FlutterNativeSplash.remove();
}

Future initialize() async {
  await Future.delayed(const Duration(seconds: 3));
}
