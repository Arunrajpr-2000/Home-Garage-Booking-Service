import 'package:accent_service_app/common/const.dart';
import 'package:accent_service_app/common/drawer_widget.dart';
import 'package:accent_service_app/view/booking_status/booking_status_screen.dart';
import 'package:accent_service_app/view/home/home_screen.dart';
import 'package:accent_service_app/view/main_page/widget/bottom_widget.dart';
import 'package:accent_service_app/view/menu_screen/menu_screen.dart';
import 'package:accent_service_app/view/push_notification/push_notification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? mtoken = '';
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        mtoken = token;
        print('My token is $mtoken');
      });
      saveToken(token!);
    });
  }

  void saveToken(String token) async {
    await FirebaseFirestore.instance
        .collection('UserTokens')
        .doc(currentuser)
        .set({'token': token});
  }

  final _pages = [
    const HomeScreen(),
    const BookingStatusScreen(),
    MenuScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const DrawerWidget(),
      backgroundColor: const Color(0xff1a1b1f),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Builder(builder: (BuildContext context) {
          return AppBar(
            centerTitle: true,
            scrolledUnderElevation: 0,
            elevation: 0,
            backgroundColor: const Color(0xff74d3d9),
            // Color.fromARGB(255, 77, 159, 161),
            leading: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.grid_view_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
            // title: const Text(
            //   'Home',
            //   style: TextStyle(
            //     fontFamily: "poppinz",
            //     color: Colors.white,
            //     fontSize: 20,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            actions: [
              IconButton(
                  onPressed: () {
                    Get.to(() => const NotificationScreen());
                  },
                  icon: const Icon(
                    Icons.notifications_active,
                    color: Colors.white,
                    size: 30,
                  )),
              // GestureDetector(
              //   onTap: () async {
              //     await whatsAppchat(context);
              //   },
              //   child: Container(
              //     height: 40,
              //     width: 40,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(12),
              //         color: Colors.white,
              //         image: DecorationImage(
              //             image: NetworkImage(
              //               'https://cdn-icons-png.flaticon.com/512/124/124034.png?w=360',
              //             ),
              //             fit: BoxFit.cover)),
              //   ),
              // ),
              k10width
            ],
          );
        }),
      ),
      drawer: const DrawerWidget(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: <Color>[
                Color(0xff74d3d9),
                //  Color.fromARGB(255, 77, 159, 161),
                // Color(0xff2e2e2e),
                // Color(0xff2e2e2e),
                Color(0xff1a1b1f), Color(0xff1a1b1f),

                // Colors.black, Colors.black
              ]),
        ),
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, child) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
