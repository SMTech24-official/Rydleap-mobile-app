import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rydleap/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation to portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const Rydleap());
  });
}
