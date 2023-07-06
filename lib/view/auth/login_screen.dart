import 'dart:developer';
import 'package:accent_service_app/common/const.dart';
import 'package:accent_service_app/common/snackbar.dart';
import 'package:accent_service_app/function/addaddress_fun.dart';
import 'package:accent_service_app/model/profile_model.dart';
import 'package:accent_service_app/view/auth/widget/auth_button.dart';
import 'package:accent_service_app/view/home/home_screen.dart';
import 'package:accent_service_app/view/main_page/main_page.dart';
import 'package:accent_service_app/view/payment_screen/widget/textfield_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  // String? phonenumber;
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  String? verificationId;

  FirebaseAuth auth = FirebaseAuth.instance;
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
                //  Color.fromARGB(255, 77, 159, 161),
                // Color(0xff2e2e2e),
                // Color(0xff2e2e2e),
                Color(0xff1a1b1f), Color(0xff1a1b1f),

                // Colors.black, Colors.black
              ]),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login To Your Account',
                style: TextStyle(
                  fontFamily: "poppinz",
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              k30height,
              TextfieldContainer(
                controller: _phoneController,
                leadingIcon: const Icon(
                  Icons.phone_android_outlined,
                  color: Colors.white,
                ),
                hinttext: 'Enter Phone Number',
              ),
              // k20height,
              // ElevatedButton(
              //   style: ButtonStyle(
              //       backgroundColor: MaterialStateProperty.all(Colors.amber)),
              //   onPressed: () async {
              //     await verifyPhoneNumber(
              //         phonenumber ?? '+${_phoneController.text}', context);
              //   },
              //   child: Text('Verify Phone Number'),
              // ),
              // k20height,
              // TextfieldContainer(
              //   //obscureText: true,
              //   controller: _codeController,
              //   leadingIcon: const Icon(Icons.lock),
              //   hinttext: 'Enter otp',
              // ),
              k30height,

              AuthbuttonWidget(
                  title: 'SignIn',
                  onTap: () async {
                    await verifyPhoneNumber(
                        '+91${_phoneController.text}', context);
                    // Get.off(HomeScreen());
                    // await signInWithPhoneNumber(
                    //         _codeController.text.trim(), context)
                    //     .then((value) => Get.off(HomeScreen()));
                  }),
              // k30height,
              // GestureDetector(
              //   //onTap: () => Get.to(ForgotScreen()),
              //   child: Text(
              //     'Forgot the password?',
              //     style: TextStyle(
              //         fontWeight: FontWeight.w400,
              //         fontSize: ScreenUtil().setSp(15),
              //         color: yellowcolor),
              //   ),
              // ),
              // k20height,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       "Don't have an account ? ",
              //       style: TextStyle(
              //           fontWeight: FontWeight.w400,
              //           fontSize: ScreenUtil().setSp(15),
              //           color: Colors.grey),
              //     ),
              //     GestureDetector(
              //       onTap: () => Get.to(SignUpScreen()),
              //       child: Text(
              //         "Sign Up",
              //         style: TextStyle(
              //             fontWeight: FontWeight.w400,
              //             fontSize: ScreenUtil().setSp(15),
              //             color: yellowcolor),
              //       ),
              //     ),
              //   ],
              // ),
              // k20height
            ],
          ),
        ),
      ),
    );
  }

  Future<void> verifyPhoneNumber(String phoneNumber, context) async {
    // ignore: prefer_function_declarations_over_variables
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await auth.signInWithCredential(phoneAuthCredential);
    };

    // ignore: prefer_function_declarations_over_variables
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      Utils.showSnackBar(
          text:
              'Phone verification failed : ${authException.code} \n ${authException.message}',
          context: context);
      log('Phone verification failed. Code: ${authException.code}. Message: ${authException.message}');
    };

    // ignore: prefer_function_declarations_over_variables
    PhoneCodeSent codeSent =
        (String verificationId, [int? forceResendingToken]) async {
      this.verificationId = verificationId;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Enter OTP',
                    style: TextStyle(
                      fontFamily: "poppinz",
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    controller: _codeController,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: 'Verification Code',
                    ),
                  ),
                  k20height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontFamily: "poppinz",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                        ),
                        child: const Text(
                          'Verify',
                          style: TextStyle(
                            fontFamily: "poppinz",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () async {
                          await signInWithPhoneNumber(
                              _codeController.text.trim(),
                              context,
                              phoneNumber);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      this.verificationId = verificationId;
    };

    await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        timeout: const Duration(seconds: 100));
  }

  Future<void> signInWithPhoneNumber(
      String smsCode, context, String phoneNumber) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId!, smsCode: smsCode);
      await auth.signInWithCredential(credential).then((value) {
        addAddressFun(profileModel: ProfileModel(phonenumber: phoneNumber));
        Get.off(MainScreen());
      });
      Utils.showSnackBar(context: context, text: 'Otp Verification Success');

      log('opt code correctt');
    } catch (e) {
      Utils.showSnackBar(context: context, text: 'Otp Verification Failed');
      log('Error: $e');
    }
  }
}
