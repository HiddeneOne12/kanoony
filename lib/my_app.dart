import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/main.dart';
import 'core/constants/object_constants/object_constants.dart';
import 'core/helpers/logger.dart';
import 'core/routing/routing_config.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        if (!isAllowed) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Allow Notifications'),
              content:
                  const Text('Our app would like to send you notifications'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Don\'t Allow',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () => AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context)),
                  child: const Text(
                    'Allow',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );

    super.initState();

    FirebaseMessaging.onMessage.listen((message) {
      dp(msg: "message object", arg: message.data.toString());
      dp(msg: "title", arg: message.notification?.title ?? '');
      dp(msg: "body", arg: message.notification?.body ?? {});
      createNotification(
        title: message.notification!.title.toString(),
        body: message.notification!.body.toString(),
        type: message.data["notification_type"].toString(),
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      dp(msg: "message object", arg: message.toString());
      dp(msg: "title", arg: message.notification!.title);
      dp(msg: "body", arg: message.notification!);
      createNotification(
        title: message.notification!.title.toString(),
        body: message.notification!.body.toString(),
        type: message.data["notification_type"].toString(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return ProviderScope(
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Kanoony',
            theme: appTheme.lightTheme(context),
            routerConfig: routerConfigs,
          ),
        );
      },
    );
  }
}
