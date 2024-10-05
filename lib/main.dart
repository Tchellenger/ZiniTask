import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:zini_task/src/background_service.dart';

import 'src/app.dart';

bool isRunning = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeService();
  isRunning = await FlutterBackgroundService().isRunning();
  runApp(const MyApp());
}
