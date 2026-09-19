import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_init/pages/notification_page.dart'
    show NotificationPage;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../main.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  log("Notification Recived in Background ${message.messageId}");
}

class PushNotificationService {
  
  PushNotificationService._internal();

  static final PushNotificationService _instance =
      PushNotificationService._internal();

  factory PushNotificationService() => _instance;

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await _requestPermission();
    await _getToken();
    await _setupLocalNotifications();
    _listenToMessages();
    await _checkForInitialMessage();
  }

  Future<void> _requestPermission() async {
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    log('User Permessions Status: ${settings.authorizationStatus}');
  }

  Future<String?> _getToken() async {
    try {
      String? token = await _fcm.getToken();
      print(token);
      return token;
    } catch (e) {
      log("Field to get Token $e");
      return null;
    }
  }

  Future<void> _setupLocalNotifications() async {
    const AndroidInitializationSettings androidInitSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings iosInitSettings =
        DarwinInitializationSettings();

    const InitializationSettings initSettings = InitializationSettings(
      android: androidInitSettings,
      iOS: iosInitSettings,
    );

    await _localNotificationsPlugin.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        log("Local Notification Was Pressed");
        _handleNotificationTap(data: {"payload": response.payload});
      },
    );
  }

  void _listenToMessages() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log("Press on Notification while App in Foreground Opended");
      if (message.notification != null) {
        _showLocalNotification(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log("Press on Notification while App in Background Opened");
      _handleNotificationTap(message: message);
    });
  }

  Future<void> _checkForInitialMessage() async {
    RemoteMessage? initialMessage = await _fcm.getInitialMessage();
    if (initialMessage != null) {
      log("Press on Notification And App is Terminited");
      Future.delayed(const Duration(milliseconds: 500), () {
        _handleNotificationTap(message: initialMessage);
      });
    }
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'saas_channel_id',
          'SaaS Notifications',
          importance: Importance.max,
          priority: Priority.high,
          showWhen: true,
        );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: DarwinNotificationDetails(),
    );

    await _localNotificationsPlugin.show(
      id: message.hashCode,
      title: message.notification?.title,
      body: message.notification?.body,
      notificationDetails: platformDetails,
      payload: message.data.toString(),
    );
  }

  void _handleNotificationTap({
    Map<dynamic, dynamic>? data,
    RemoteMessage? message,
  }) {
    if (data == null && message == null) return;
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) => NotificationPage(
          message:
              message ??
              RemoteMessage(notification: RemoteNotification(title: "title")),
        ),
      ),
    );
  }
}
