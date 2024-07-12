import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'core/constants/object_constants/object_constants.dart';
import 'my_app.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  createNotification(
    title: message.notification!.title.toString(),
    body: message.notification!.body.toString(),
    type: message.data["notification_type"].toString(),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51N2xNsBozUf5joGRDVYeGaZT6CEgvN3IIshXGO8W83N2UhF48afcuZfsXDQCpy3e8OEozBd0JAG5CgfWX3ZXlJUm00zR2arFlu';
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCZYXlEbka0HK4wHOcZgd_FEFebT9HUE4k",
          authDomain: "kanoony-fe8c1.firebaseapp.com",
          projectId: "kanoony-fe8c1",
          storageBucket: "kanoony-fe8c1.appspot.com",
          messagingSenderId: "557517649496",
          appId: "1:557517649496:web:661c4fc7ab506ee2887c2d",
          // 1:557517649496:android:9321e63724678459887c2d
          measurementId: "G-S19NVTG0JP"));
  Stripe.merchantIdentifier = 'stripe payment';
  await Stripe.instance.applySettings();
  AwesomeNotifications().initialize(
    'resource://drawable/logo',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        channelDescription: 'basic_channel',
      ),
    ],
  ).then((value) => logger.i(value));
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(   DevicePreview(
     builder: (context) => const MyApp()));
}

Future<void> createNotification(
    {required String title, required String body, required String type}) async {
  await AwesomeNotifications().createNotification(
    //schedule: NotificationSchedule(timeZone: ''),
    actionButtons: [
      NotificationActionButton(
        enabled: true,
        key: type,
        autoDismissible: false,

        label: 'View',
        requireInputText: false,
        //    actionType: ActionType.
      ),
      // NotificationActionButton(key: '', label: 'View')
    ],
    // schedule: NotificationSchedule,
    content: NotificationContent(
        autoDismissible: false,
        id: 1,
        category: NotificationCategory.Message,
        channelKey: 'basic_channel',
        //notificationLayout: NotificationLayout.Messaging,
        title: title,
        actionType: ActionType.Default,
        body: body),
  );
}
