import 'dart:developer';

import 'package:accent_service_app/model/service_model.dart';
import 'package:accent_service_app/view/service_details/service_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class serviceCardWidget extends StatelessWidget {
  serviceCardWidget({super.key, required this.list, required this.onTap});

  final List<ServiceModel> list;

  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
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
          double percentage = double.parse(list[index].price) / 100 * 20;
          //   log(percentage.toString());
          double percentprice = double.parse(list[index].price) - percentage;

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
                      padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
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
  }
}



 



            /////////////////////
            ///
            ///
    // Container(
    //           // padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
    //           margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    //           decoration: BoxDecoration(
    //               color: Color(0xff2e302f),
    //               borderRadius: BorderRadius.circular(20)),
    //           child: Column(
    //             children: [
                  // Container(
                  //   height: 100,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.only(
                  //         topLeft: Radius.circular(20),
                  //         topRight: Radius.circular(20)),
                  //     image: DecorationImage(
                  //       image: NetworkImage(
                  //         list[index].backgroundImg,
                  //       ),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.only(bottom: 5, left: 8),
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     list[index].specificservicename,
                  //     maxLines: 2,
                  //     style: TextStyle(
                  //         fontFamily: 'poppinz',
                  //         overflow: TextOverflow.ellipsis,
                  //         color: Colors.white,
                  //         fontSize: 14,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  // ),
              //     Container(
              //       padding: const EdgeInsets.only(left: 10, bottom: 5),
              //       alignment: Alignment.centerLeft,
                    // child: Text(
                    //   "₹ ${list[index].price}",
                    //   style: TextStyle(
                    //       fontFamily: 'poppinz',
                    //       overflow: TextOverflow.ellipsis,
                    //       color: Colors.white,
                    //       fontSize: 14,
                    //       fontWeight: FontWeight.bold),
                    // ),
              //     ),
              //   ],
              // ),
           // )