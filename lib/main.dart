import 'dart:convert';

import 'package:accent_service_app/view/menu_screen/menu_screen.dart';
import 'package:accent_service_app/view/splash_screen/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'high_importance_channel', 'High Importance Notifications',
//     description: 'This channel is used for important notifications.',
//     importance: Importance.high,
//     playSound: true);

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // await Firebase.initializeApp();
  print('Handling a background message: ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getInitialMessage();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<
  //         AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);

  // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //     alert: true, badge: true, sound: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Home Garage',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // appBarTheme: AppBarTheme(elevation: 0),
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen());
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   TextEditingController username = TextEditingController();
//   TextEditingController title = TextEditingController();
//   TextEditingController body = TextEditingController();
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   String? mtoken = '';

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     requestPermission();
//     getToken();
//     initInfo();
//   }

//   initInfo() {
//     var androidInitialize =
//         const AndroidInitializationSettings('@mipmap/launcher_icon');
//     var initializationSettings =
//         InitializationSettings(android: androidInitialize);

//     flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: (String? payload) async {
//       try {
//         if (payload != null && payload.isNotEmpty) {
//         } else {}
//       } catch (e) {}
//       return;
//     });

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       print('--------------oN Mesg------------');
//       print(
//           'onMessage: ${message.notification?.title}/${message.notification?.body}');

//       BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
//           message.notification!.body.toString(),
//           htmlFormatBigText: true,
//           contentTitle: message.notification!.title.toString(),
//           htmlFormatContentTitle: true);

//       AndroidNotificationDetails androidplatformChannelSpecifics =
//           AndroidNotificationDetails('dbfood', 'dbfood',
//               importance: Importance.high,
//               styleInformation: bigTextStyleInformation,
//               priority: Priority.high,
//               playSound: false);

//       NotificationDetails platformChannelSpecifics =
//           NotificationDetails(android: androidplatformChannelSpecifics);

//       await flutterLocalNotificationsPlugin.show(0, message.notification?.title,
//           message.notification?.body, platformChannelSpecifics,
//           payload: message.data['title']);
//     });
//   }

//   void getToken() async {
//     await FirebaseMessaging.instance.getToken().then((token) {
//       setState(() {
//         mtoken = token;
//         print('My token is $mtoken');
//       });
//       saveToken(token!);
//     });
//   }

//   void saveToken(String token) async {
//     await FirebaseFirestore.instance
//         .collection('UserTokens')
//         .doc(currentuser)
//         .set({'token': token});
//   }

//   void requestPermission() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;

//     NotificationSettings settings = await messaging.requestPermission(
//         alert: true,
//         announcement: false,
//         badge: true,
//         carPlay: false,
//         criticalAlert: false,
//         provisional: false,
//         sound: true);

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print('User granted permission');
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       print('User granted provisional permission');
//     } else {
//       print('User declined');
//     }
//   }

//   void sendpushMessage(String token, String body, String title) async {
//     try {
//       await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
//           headers: <String, String>{
//             'Content-Type': 'application/json',
//             'Authorization':
//                 'key=AAAACrkkBf0:APA91bHW310siHIkmdoBUdT1UfDrEm76bH7z1FBKDDIn3LF36js6jfBCL5wZgSySk2XzP3DIii_-94BMnrrSKIGvx_v_k18MAGSRG2rg7YfKZotBcVwDPHB7ct480b8C8QSRrkBsX76E'
//           },
//           body: jsonEncode(<String, dynamic>{
//             'priority': 'high',
//             'data': <String, dynamic>{
//               'click_action': 'FLUTTER_NOTIFICATION_CLICK',
//               'status': 'done',
//               'body': body,
//               'title': title
//             },
//             "notification": <String, dynamic>{
//               "title": title,
//               "body": body,
//               "android_channel_id": 'dbfood'
//             },
//             "to": token,
//           }));
//     } catch (e) {
//       if (kDebugMode) {
//         print('Error push notification');
//       }
//     }
//   }
//   // int _counter = 0;

//   // void shownotification() async {
//   //   setState(() {
//   //     _counter++;
//   //   });
//   //   flutterLocalNotificationsPlugin.show(
//   //       0,
//   //       'Testing $_counter',
//   //       'How are you',
//   //       NotificationDetails(
//   //           android: AndroidNotificationDetails(channel.id, channel.name,
//   //               channelDescription: channel.description,
//   //               color: Colors.green,
//   //               playSound: true,
//   //               icon: '@mipmap/launcher_icon',
//   //               importance: Importance.high)));
//   // }

//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//   //     RemoteNotification? notification = message.notification;
//   //     AndroidNotification? android = message.notification?.android;

//   //     if (notification != null && android != null) {
//   //       flutterLocalNotificationsPlugin.show(
//   //           notification.hashCode,
//   //           notification.title,
//   //           notification.body,
//   //           NotificationDetails(
//   //               android: AndroidNotificationDetails(channel.id, channel.name,
//   //                   channelDescription: channel.description,
//   //                   color: Colors.green,
//   //                   playSound: true,
//   //                   icon: '@mipmap/launcher_icon')));
//   //     }
//   //   });

//   //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//   //     print('A new onMessageOpenedApp event was Published!');
//   //     RemoteNotification? notification = message.notification;
//   //     AndroidNotification? android = message.notification?.android;
//   //     if (notification != null && android != null) {
//   //       showDialog(
//   //         context: context,
//   //         builder: (_) {
//   //           return AlertDialog(
//   //             title: Text(notification.title.toString()),
//   //             content: SingleChildScrollView(
//   //               child: Column(
//   //                 children: [Text(notification.body.toString())],
//   //               ),
//   //             ),
//   //           );
//   //         },
//   //       );
//   //     }
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                 controller: username,
//               ),
//               TextFormField(
//                 controller: title,
//               ),
//               TextFormField(
//                 controller: body,
//               ),
//               GestureDetector(
//                 onTap: () async {
//                   String name = username.text.trim();
//                   String titletext = title.text;
//                   String bodytext = body.text;

//                   if (name != '') {
//                     DocumentSnapshot snapshot = await FirebaseFirestore.instance
//                         .collection('UserTokens')
//                         .doc(name)
//                         .get();

//                     String token = snapshot['token'];

//                     print(token);
//                     sendpushMessage(token, bodytext, titletext);
//                   }
//                 },
//                 child: Text('Button'),
//               )
//             ],
//           ),
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: shownotification,
//       //   child: Icon(Icons.add),
//       // ),
//     );
//   }
// }
