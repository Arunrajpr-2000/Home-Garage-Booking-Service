import 'dart:developer';

import 'package:accent_service_app/common/const.dart';
import 'package:accent_service_app/model/service_model.dart';
import 'package:accent_service_app/view/home/widget/service_card_widget.dart';
import 'package:accent_service_app/view/service_details/service_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class InsideCate extends StatelessWidget {
  InsideCate({super.key, required this.cate});
  String cate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff74d3d9),
        title: Text(
          cate,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: <Color>[
              Color(0xff74d3d9),
              Color(0xff1a1b1f),
              Color(0xff1a1b1f),
            ],
          ),
        ),
        child: StreamBuilder<List<ServiceModel>>(
            stream: FirebaseFirestore.instance
                .collection('categories')
                .doc('categories')
                .collection(cate)
                .snapshots()
                .map((event) => event.docs
                    .map((e) => ServiceModel.fromJson(e.data()))
                    .toList()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ServiceModel> list = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: GridView.builder(
                    itemCount: list.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.80,
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 10.0,
                    ),

                    itemBuilder: (context, index) {
                      double percentage =
                          double.parse(list[index].price) / 100 * 20;
                      //   log(percentage.toString());
                      double percentprice =
                          double.parse(list[index].price) - percentage;

                      //log(percentprice.toString());
                      return GestureDetector(
                          onTap: () {
                            log(list[index].specificservicename);
                            Get.to(ServiceDetailScreen(
                                serviceModel: ServiceModel(
                                    discount: list[index].discount,
                                    cartImg: list[index].cartImg,
                                    mainservicename:
                                        list[index].mainservicename,
                                    specificservicename:
                                        list[index].specificservicename,
                                    price: list[index].price,
                                    backgroundImg: list[index].backgroundImg,
                                    description: list[index].description,
                                    imgsubheading: list[index].imgsubheading)));
                          },
                          child: Stack(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(
                                      top: 15, left: 10, right: 10),
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      // image: DecorationImage(
                                      //   image: NetworkImage(
                                      //     list[index].backgroundImg,
                                      //   ),
                                      //   fit: BoxFit.cover,
                                      // ),
                                      color: Colors.black87),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 100,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              list[index].backgroundImg,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        //padding: const EdgeInsets.only(bottom: 5, left: 5),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          list[index].specificservicename,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontFamily: 'poppinz',
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      // k10height,
                                      // Row(
                                      //   mainAxisSize: MainAxisSize.min,
                                      //   children: [
                                      // Text(
                                      //   "From ₹ 250",
                                      //   //  ${percentprice.toStringAsFixed(2)}",
                                      //   style: TextStyle(
                                      //       fontFamily: 'poppinz',
                                      //       overflow: TextOverflow.ellipsis,
                                      //       color: Colors.white,
                                      //       fontSize: 15,
                                      //       fontWeight: FontWeight.bold),
                                      // ),
                                      //     // Text(
                                      //     //   " incl. GST",
                                      //     //   style: TextStyle(
                                      //     //       fontFamily: 'poppinz',
                                      //     //       overflow: TextOverflow.ellipsis,
                                      //     //       color: Colors.grey,
                                      //     //       fontSize: 12,
                                      //     //       fontWeight: FontWeight.bold),
                                      //     // ),
                                      //   ],
                                      // ),
                                      //k10height,
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "From ₹ ${list[index].price}",
                                          //  ${percentprice.toStringAsFixed(2)}",
                                          style: TextStyle(
                                              fontFamily: 'poppinz',
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  )),
                              Positioned(
                                  top: 0,
                                  left: 2,
                                  child: CircleAvatar(
                                    child: Text(
                                      '${list[index].discount}%',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.red,
                                    radius: 20,
                                  ))
                            ],
                          ));
                    },
                    // physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
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
            }),
      ),
    );
  }
}
