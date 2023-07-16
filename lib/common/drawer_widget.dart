import 'package:accent_service_app/common/const.dart';
import 'package:accent_service_app/common/snackbar.dart';
import 'package:accent_service_app/view/auth/login_screen.dart';
import 'package:accent_service_app/view/menu_screen/widget/menu_tile_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.black,
        child: SizedBox(
            child: Column(children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: <Color>[
                      Color(0xff74d3d9),

                      //  Color.fromARGB(255, 77, 159, 161),
                      // Color(0xff2e2e2e),
                      // Color(0xff2e2e2e),
                      Color(0xff1a1b1f),

                      // Colors.black, Colors.black
                    ]),
              ),
              child: Center(
                  child: Text(
                'Home Garage',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "poppinz",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ))),
          k10height,
          MenuTileWidget(onTap: () {}, iconData: Icons.home, title: 'Home'),
          k10height,
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
          // MenuTileWidget(
          //     onTap: () {},
          //     iconData: Icons.help_outline_rounded,
          //     title: 'Help Centre'),
          // k10height,
          // MenuTileWidget(
          //     onTap: () {}, iconData: Icons.lock, title: 'Privacy Policy'),
          k10height,
          MenuTileWidget(
              onTap: () async {
                await FirebaseAuth.instance
                    .signOut()
                    .then((value) => Get.offAll(LoginScreen()));

                Utils.showSnackBar(context: context, text: 'Logoutted');
              },
              iconData: Icons.logout_rounded,
              title: 'Log Out'),
        ])));
  }
}
