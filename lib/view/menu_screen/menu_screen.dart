import 'dart:developer';

import 'package:accent_service_app/common/const.dart';
import 'package:accent_service_app/common/snackbar.dart';
import 'package:accent_service_app/function/whatsapp_chat_fun.dart';
import 'package:accent_service_app/model/profile_model.dart';
import 'package:accent_service_app/view/auth/is_login.dart';
import 'package:accent_service_app/view/menu_screen/widget/menu_tile_widget.dart';
import 'package:accent_service_app/view/menu_screen/widget/terms_and_condition.dart';
import 'package:accent_service_app/view/profile_screen/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

final currentuser = FirebaseAuth.instance.currentUser!.phoneNumber;

class MenuScreen extends StatefulWidget {
  MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
// Assuming you have a user collection in Firestore and a document for each user
  String username = "@UserName";

  String? phonenumber;
  String? imgurl;

  String? email;
  String? city;
  String? nearby;
  String? state;
  String? street;
  String? postal;

  //  Map<String, dynamic> userDetails = await getUserDetails();
  Future<void> getUserDetails() async {
    // final userId = 'your_user_id_here';

    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentuser)
          .get();

      if (userDoc.exists) {
        final userData = userDoc.data();
        // Access specific fields from the user document
        setState(() {
          username = userData!['username'];

          phonenumber = userData['phonenumber'];
          imgurl = userData['image'];
          email = userData['email'];
          city = userData['cityordistrict'];
          nearby = userData['nearby'];
          state = userData['state'];
          street = userData['street'];
          postal = userData['postalcode'];
        });
      } else {
        print('User document does not exist');
      }
    } catch (e) {
      print('Error retrieving user details: $e');
    }
  }

  final Uri _url = Uri.parse(
      'https://www.freeprivacypolicy.com/live/7909d261-b8f2-4a66-8050-2f321e49ddbe');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserDetails();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    getUserDetails();
    return Scaffold(
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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage:
                      // NetworkImage(user.photoURL!)
                      NetworkImage(imgurl ??
                          'https://www.goodmorningimagesdownload.com/wp-content/uploads/2021/12/Best-Quality-Profile-Images-Pic-Download-2023.jpg'),
                  radius: 70,
                ),
                Text(
                  username,
                  style: const TextStyle(
                    fontFamily: "poppinz",
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  currentuser ?? 'Phone Number',
                  style: const TextStyle(
                    fontFamily: "poppinz",
                    color: Colors.white60,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                k10height,
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      Get.to(ProfileScreen(
                          profileModel: ProfileModel(
                              phonenumber: currentuser.toString(),
                              cityordistrict: city ?? 'Enter City/District',
                              email: email ?? 'Enter Email',
                              nearby: nearby ?? 'Enter Near by location',
                              postalcode: postal ?? 'Enter Postal Code',
                              state: state ?? 'Enter state',
                              street: street ?? 'Enter street',
                              username: username == "@UserName"
                                  ? 'Enter UserName'
                                  : username,
                              image: imgurl)));
                    },
                    child: const Text(
                      'Update Profile',
                      style: TextStyle(
                        fontFamily: "poppinz",
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )),
                k10height,
                const Divider(
                  color: Colors.white,
                  endIndent: 15,
                  indent: 15,
                ),
                MenuTileWidget(
                    onTap: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: const Column(
                              children: [
                                Text(
                                  "Home Garage",
                                  style: TextStyle(
                                      fontFamily: "poppinz",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                // Text('1.0.0')
                              ],
                            ),
                            content: Text(
                              'Home Garage !! is designed and developed by\n Accent Next Technologies',
                              style: TextStyle(
                                  fontFamily: "poppinz",
                                  // fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'OK',
                                  style: TextStyle(
                                    color: Color(0xffdd0021),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    iconData: Icons.info_outline_rounded,
                    title: 'About'),
                k10height,
                MenuTileWidget(
                    onTap: () async {
                      await whatsAppchat(context);
                    },
                    icon: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/512/124/124034.png?w=360',
                              ),
                              fit: BoxFit.cover)),
                    ),
                    iconData: Icons.lock,
                    title: 'Chat On Whatsapp'),
                k10height,
                MenuTileWidget(
                    onTap: () async {
                      await _launchUrl();
                    },
                    iconData: Icons.lock,
                    title: 'Privacy Policy'),
                k10height,
                MenuTileWidget(
                    onTap: () {
                      Get.dialog(Policydialog(
                        radius: 5,
                        mdFilename: 'terms_and_conditions.md',
                      ));
                    },
                    iconData: Icons.privacy_tip_outlined,
                    title: 'Terms & Conditions'),
                k10height,
                MenuTileWidget(
                    onTap: () {
                      log('help');
                    },
                    iconData: Icons.share_rounded,
                    title: 'Invite Friends'),
                k10height,

                MenuTileWidget(
                    onTap: () async {
                      await FirebaseAuth.instance
                          .signOut()
                          .then((value) => Get.off(IsLogin()));

                      Utils.showSnackBar(
                          context: context, text: 'See You again!!');
                    },
                    iconData: Icons.logout_rounded,
                    title: 'Log Out'),

                // Textcontainer(icondata: Icons.person, text: 'User Name'),
                // k20height,
                // Textcontainer(icondata: Icons.email, text: 'Email'),
                // k20height,
                // Textcontainer(icondata: Icons.call, text: 'Phone Number'),
                // k20height,
                // Textcontainer(
                //     icondata: Icons.date_range_rounded, text: 'Date of Birth'),
                // k20height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
