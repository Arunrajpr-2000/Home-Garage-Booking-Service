import 'dart:developer';

import 'package:accent_service_app/model/service_model.dart';
import 'package:accent_service_app/view/service_details/service_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ServiceCardWidget extends StatelessWidget {
  ServiceCardWidget(
      {super.key, required this.list, required this.onTap, required this.name});

  final List<ServiceModel> list;
  String name;

  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 10,
      ),
      child: GridView.builder(
        itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.40,
          crossAxisCount: 1,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 10.0,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          // double percentage = double.parse(list[index].price) / 100 * 20;
          //   log(percentage.toString());
          // double percentprice = double.parse(list[index].price) - percentage;

          //log(percentprice.toString());
          return GestureDetector(
              onTap: () {
                log(list[index].specificservicename);
                Get.to(ServiceDetailScreen(
                    serviceModel: ServiceModel(
                        discount: list[index].discount,
                        cartImg: list[index].cartImg,
                        mainservicename: list[index].mainservicename,
                        specificservicename: list[index].specificservicename,
                        price: list[index].price,
                        backgroundImg: list[index].backgroundImg,
                        description: list[index].description,
                        imgsubheading: list[index].imgsubheading)));
              },
              child: Stack(
                children: [
                  Container(
                      padding:
                          const EdgeInsets.only(top: 15, left: 10, right: 10),
                      height: 200,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
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
                              style: const TextStyle(
                                  fontFamily: 'poppinz',
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "From ₹ ${list[index].price}",
                              //  ${percentprice.toStringAsFixed(2)}",
                              style: const TextStyle(
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
                        backgroundColor: Colors.green,
                        radius: 20,
                        child: Text(
                          '${list[index].discount}%',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ))
                ],
              ));
        },
        shrinkWrap: true,
      ),
    );
  }
}
