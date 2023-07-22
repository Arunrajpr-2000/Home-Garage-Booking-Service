import 'package:accent_service_app/model/service_model.dart';
import 'package:accent_service_app/view/home/widget/service_card_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WashingStream extends StatelessWidget {
  const WashingStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ServiceModel>>(
        stream: FirebaseFirestore.instance
            .collection('categories')
            .doc('Washing')
            .collection('Washing')
            .snapshots()
            .map((event) => event.docs
                .map((e) => ServiceModel.fromJson(e.data()))
                .toList()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ServiceModel> washinglist = snapshot.data!;
            return Center(
              child: ServiceCardWidget(
                name: 'Washing Services',
                list: washinglist,
                onTap: () {},
              ),
            );
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
        });
  }
}
