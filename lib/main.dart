import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './core/di/dependency_injection.dart' as get_it;
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  await get_it.init();

  runApp(MyApp());
}

