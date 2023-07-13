import 'dart:developer';

import 'package:accent_service_app/common/const.dart';
import 'package:accent_service_app/model/order_model.dart';
import 'package:accent_service_app/view/booking_status/widget/timeline.dart';
import 'package:accent_service_app/view/menu_screen/menu_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class UpcomingOrder extends StatelessWidget {
  const UpcomingOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<List<OrderModel>>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(currentuser)
              .collection('orders')
              .snapshots()
              .map((event) => event.docs
                  .map((e) => OrderModel.fromJson(e.data()))
                  .toList()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<OrderModel> orderlist = snapshot.data!;
              if (orderlist.isNotEmpty) {
                return ListView.separated(
                  separatorBuilder: (context, index) => k10height,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    DateTime now = DateTime.parse(orderlist[index].datetime);
                    String formattedDate =
                        DateFormat('dd MMMM yyyy').format(now);
                    String timeformat = DateFormat("hh:mm:ss a").format(now);
                    log(formattedDate);
                    //log(timeformat);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xff2e302f),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              // offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Date & Time",
                                    style: TextStyle(
                                      fontFamily: "poppinz",
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "$formattedDate\n$timeformat",
                                    style: const TextStyle(
                                      fontFamily: "poppinz",
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                  ),
                                  k10height,
                                  const Text(
                                    "Service",
                                    style: TextStyle(
                                      fontFamily: "poppinz",
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    orderlist[index].specificservicename,
                                    style: const TextStyle(
                                      fontFamily: "poppinz",
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                  ),
                                  k10height,
                                  const Text(
                                    "Booking ID",
                                    style: TextStyle(
                                      fontFamily: "poppinz",
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    orderlist[index].orderid,
                                    style: const TextStyle(
                                      fontFamily: "poppinz",
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  k10height,
                                  const Text(
                                    "Status",
                                    style: TextStyle(
                                      fontFamily: "poppinz",
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    orderlist[index].isDelivered == false
                                        ? "Incomplete"
                                        : "Completed",
                                    style: TextStyle(
                                      fontFamily: "poppinz",
                                      fontSize: 15,
                                      color:
                                          orderlist[index].isDelivered == false
                                              ? Colors.red
                                              : Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  k10height
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black,
                                  ),
                                  height: 200,
                                  width: 130,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: TimelineTileDemo(
                                        orderModel: OrderModel(
                                            availabledate:
                                                orderlist[index].availabledate,
                                            availabletime:
                                                orderlist[index].availabletime,
                                            estimatedetails: orderlist[index]
                                                .estimatedetails,
                                            mainservicename: orderlist[index]
                                                .mainservicename,
                                            specificservicename:
                                                orderlist[index]
                                                    .specificservicename,
                                            price: orderlist[index].price,
                                            orderid: orderlist[index].orderid,
                                            isDelivered:
                                                orderlist[index].isDelivered,
                                            isCanceled:
                                                orderlist[index].isCanceled,
                                            datetime: orderlist[index].datetime,
                                            paymentmethod:
                                                orderlist[index].paymentmethod,
                                            userphonenumber: orderlist[index]
                                                .userphonenumber,
                                            ispending:
                                                orderlist[index].ispending,
                                            isaccepted:
                                                orderlist[index].isaccepted,
                                            isworkstarted: orderlist[index]
                                                .isworkstarted)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text(
                    'Book any Service',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SpinKitFadingCircle(
                  color: Colors.white, // Customize the color of the spinner
                  size: 50.0, // Customize the size of the spinner
                ),
              );
            } else {
              return const Text(
                'No Data',
                style: TextStyle(color: Colors.black),
              );
            }
          }),
    );
  }
}
