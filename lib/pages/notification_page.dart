import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key, required this.message});
  final RemoteMessage message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(message.notification!.title!)));
  }
}