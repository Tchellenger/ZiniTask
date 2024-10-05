import 'dart:async';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:zini_task/src/homepage/homepage_service.dart';

Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  // ignore: unused_local_variable
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'my_foreground',
    'MY FOREGROUND SERVICE',
    description: 'This channel is used for important notifications.',
    importance: Importance.low,
  );

  // ignore: unused_local_variable
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  await service.configure(
    iosConfiguration: IosConfiguration(
      autoStart: false,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
    androidConfiguration: AndroidConfiguration(
      autoStart: false,
      onStart: onStart,
      isForegroundMode: false,
      notificationChannelId: 'my_foreground',
      initialNotificationTitle: 'BACKGROUND SERVICE',
      initialNotificationContent: 'Still Running',
    ),
  );
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  Timer.periodic(const Duration(seconds: 15), (timer) async {
    HomePageService homePageService = HomePageService.getInstance();
    String msgNotification = '';
    try {
      // ignore: unused_local_variable
      Response response = await homePageService.fetchData();
      msgNotification = 'Data Retrieved';
    } catch (e) {
      msgNotification = 'Something went wrong';
    }

    flutterLocalNotificationsPlugin.show(
      888,
      'Message Syncing',
      msgNotification,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'my_foreground',
          'MY FOREGROUND SERVICE',
          icon: 'ic_bg_service_small',
          ongoing: true,
        ),
      ),
    );
  });
}
