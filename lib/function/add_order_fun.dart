import 'dart:developer';
import 'package:accent_service_app/model/order_model.dart';
import 'package:accent_service_app/view/main_page/main_page.dart';
import 'package:accent_service_app/view/menu_screen/menu_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future addOrderFun({required OrderModel orderModel}) async {
  final orderdetails = FirebaseFirestore.instance
      .collection('users')
      .doc(currentuser)
      .collection('orders')
      .doc(orderModel.datetime);

  final json = orderModel.toJson();

  await orderdetails.set(json);
  final orderadmin =
      FirebaseFirestore.instance.collection('orders').doc(orderModel.datetime);
  await orderadmin.set(json);

  Get.off(const MainScreen());

  Get.snackbar('Successfully Booked', 'Check the Booking History',
      colorText: Colors.white, backgroundColor: Colors.green);

  log('Booked');
}
