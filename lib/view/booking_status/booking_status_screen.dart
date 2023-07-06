import 'package:accent_service_app/common/const.dart';
import 'package:accent_service_app/view/booking_status/complete_order_widget.dart';
import 'package:accent_service_app/view/booking_status/upcoming_order_widget.dart';
import 'package:flutter/material.dart';

class BookingStatusScreen extends StatefulWidget {
  const BookingStatusScreen({super.key});

  @override
  State<BookingStatusScreen> createState() => _BookingStatusScreenState();
}

class _BookingStatusScreenState extends State<BookingStatusScreen> {
  bool isButton1Clicked = true;
  bool isButton2Clicked = false;

  @override
  Widget build(BuildContext context) {
    // Widget currentWidget;

    // if (isButton1Clicked) {
    //   currentWidget = const CompletedOrder();
    // } else if (isButton2Clicked) {
    //   currentWidget = const UpcomingOrder();
    // } else {
    //   currentWidget =
    //       const CompletedOrder(); // Default widget if no button is clicked
    // }
    return Column(
      children: [k10height, UpcomingOrder()],
    );
  }
}
