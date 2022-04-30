import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/dependency_registrar/dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Dependencies.init();
  //GoogleFonts.config.allowRuntimeFetching = false;
  runApp(const MyApp());
}
