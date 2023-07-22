import 'package:accent_service_app/view/auth/login_screen.dart';
import 'package:accent_service_app/view/main_page/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class IsLogin extends StatelessWidget {
  const IsLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
              color: Colors.white,
              backgroundColor: Colors.black,
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Somthing went wrong',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          } else if (snapshot.hasData) {
            return const MainScreen();
          } else {
            return const LoginScreen();
          }
        });
  }
}
