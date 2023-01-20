import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/app/presentation/app_module.dart';
import 'modules/app/presentation/app_widget.dart';

Future<void> main() async {
  return runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return runApp(
      ModularApp(module: AppModule(), child: const AppWidget()),
    );
  }, (error, stackTrace) async {
    debugPrint('Error in runZonedGuarded: $error $stackTrace');
  });
}
