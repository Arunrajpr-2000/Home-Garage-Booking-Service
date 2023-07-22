// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AuthbuttonWidget extends StatelessWidget {
  AuthbuttonWidget({Key? key, required this.onTap, this.child})
      : super(key: key);

  void Function()? onTap;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: child),
    );
  }
}
