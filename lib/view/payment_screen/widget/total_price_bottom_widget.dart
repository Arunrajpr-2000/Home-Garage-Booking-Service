import 'dart:ffi';

import 'package:accent_service_app/common/const.dart';
import 'package:flutter/material.dart';

class TotalPriceBottomWidget extends StatelessWidget {
  TotalPriceBottomWidget(
      {Key? key,
      this.title,
      required this.onTap,
      required this.totalPrice,
      this.selectPayments})
      : super(key: key);

  final String? title;
  final String totalPrice;
  final String? selectPayments;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 360,
      decoration: const BoxDecoration(
          // Color(0xff35383F)
          color: Color(0xff35383F),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          )),
      child: Column(
        children: [
          k20height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '$title',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '₹ $totalPrice',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          k20height,
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  '$selectPayments',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
