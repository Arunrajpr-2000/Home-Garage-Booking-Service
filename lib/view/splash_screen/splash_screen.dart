import 'dart:async';
import 'dart:convert';

import 'package:accent_service_app/common/const.dart';
import 'package:accent_service_app/view/auth/is_login.dart';
import 'package:accent_service_app/view/menu_screen/menu_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  String? mtoken = '';

  // initInfo() {
  //   var androidInitialize =
  //       const AndroidInitializationSettings('@mipmap/launcher_icon');
  //   var initializationSettings =
  //       InitializationSettings(android: androidInitialize);

  //   flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //       onSelectNotification: (String? payload) async {
  //     try {
  //       if (payload != null && payload.isNotEmpty) {

  //       } else {}
  //     } catch (e) {}
  //     return;
  //   });

  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
  //     print('--------------oN Mesg------------');
  //     print(
  //         'onMessage: ${message.notification?.title}/${message.notification?.body}');

  //     BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
  //         message.notification!.body.toString(),
  //         htmlFormatBigText: true,
  //         contentTitle: message.notification!.title.toString(),
  //         htmlFormatContentTitle: true);

  //     AndroidNotificationDetails androidplatformChannelSpecifics =
  //         AndroidNotificationDetails('dbfood', 'dbfood',
  //             importance: Importance.high,
  //             styleInformation: bigTextStyleInformation,
  //             priority: Priority.high,
  //             playSound: false);

  //     NotificationDetails platformChannelSpecifics =
  //         NotificationDetails(android: androidplatformChannelSpecifics);

  //     await flutterLocalNotificationsPlugin.show(0, message.notification?.title,
  //         message.notification?.body, platformChannelSpecifics,
  //         payload: message.data['title']);
  //   });
  // }

  // Future<List<String>> getAllUserTokens() async {
  //   QuerySnapshot snapshot =
  //       await FirebaseFirestore.instance.collection('UserTokens').get();

  //   List<String> tokens = [];
  //   for (var doc in snapshot.docs) {
  //     tokens.add(doc['token']);
  //   }

  //   return tokens;
  // }

  // void sendpushMessage(List<String> tokens, String body, String title) async {
  //   try {
  //     for (String token in tokens) {
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
  //             "registration_ids": [
  //               token
  //             ], // Send the notification to each user individually
  //           }));
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Error sending push notification');
  //     }
  //   }
  // }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined');
    }
  }

  @override
  void initState() {
    super.initState();
    requestPermission();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
      Timer(const Duration(seconds: 5), () => Get.offAll(const IsLogin()));
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: <Color>[
              Color(0xff74d3d9),
              Color(0xff1a1b1f),
              Color(0xff1a1b1f),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('asset/splash logo.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              k10height,
              FadeTransition(
                opacity: _fadeAnimation,
                child: const Text(
                  "Home Garage",
                  style: TextStyle(
                    fontFamily: "poppinz",
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // const SizedBox(height: 10),
              // FadeTransition(
              //   opacity: _fadeAnimation,
              //   child: SpinKitFadingCircle(
              //     color: Colors.white, // Customize the color of the spinner
              //     size: 50.0, // Customize the size of the spinner
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
