// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Future<void> handleBackgroundMessage(RemoteMessage message) async {
//   print('Title : ${message.notification?.title}');
//   print('body : ${message.notification?.body}');
//   print('payload : ${message.data}');
// }

// class FirebaseApi {
//   final _firebaseMessaging = FirebaseMessaging.instance;
//   static final _notifications = FlutterLocalNotificationsPlugin();

//   Future initNotifications() async {
//     await _firebaseMessaging.requestPermission();
//     final fcmtoken = await _firebaseMessaging.getToken();
//     print('Token : $fcmtoken');
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//   }

//   // static Future _noticationDetails() async {
//   //   return NotificationDetails(
//   //       android: AndroidNotificationDetails('channel id', 'channel name',
//   //           importance: Importance.max));
//   // }

//   // static Future showNotification({
//   //   int id = 0,
//   //   String? title,
//   //   String? body,
//   //   String? payload,
//   // }) async =>
//   //     _notifications.show(id, title, body, await _noticationDetails(),
//   //         payload: payload);
// }
