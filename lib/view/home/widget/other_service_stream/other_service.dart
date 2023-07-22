import 'package:accent_service_app/common/const.dart';
import 'package:accent_service_app/view/service_details/service_details.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:accent_service_app/model/service_model.dart';
import 'package:get/get.dart';

class OtherServiceStream extends StatefulWidget {
  const OtherServiceStream({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OtherServiceStreamState createState() => _OtherServiceStreamState();
}

class _OtherServiceStreamState extends State<OtherServiceStream> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 10, top: 10),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('categories').snapshots(),
        builder: (context, snap) {
          if (snap.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snap.data!.docs.length,
              itemBuilder: (context, index) {
                QueryDocumentSnapshot documentsnampshot =
                    snap.data!.docs[index];

                if (documentsnampshot['name'] != 'Cleaning' &&
                    documentsnampshot['name'] != 'Service' &&
                    documentsnampshot['name'] != 'Washing') {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        documentsnampshot['name'],
                        maxLines: 1,
                        style: const TextStyle(
                            fontFamily: 'poppinz',
                            overflow: TextOverflow.ellipsis,
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      k10height,
                      SizedBox(
                        height: 210,
                        child: StreamBuilder<List<ServiceModel>>(
                          stream: FirebaseFirestore.instance
                              .collection('categories')
                              .doc(documentsnampshot['name'])
                              .collection(documentsnampshot['name'])
                              .snapshots()
                              .map((event) => event.docs
                                  .map((e) => ServiceModel.fromJson(e.data()))
                                  .toList()),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<ServiceModel> washinglist = snapshot.data!;

                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 10),
                                child: GridView.builder(
                                  itemCount: washinglist.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 1.40,
                                    crossAxisCount: 1,
                                    crossAxisSpacing: 1.0,
                                    mainAxisSpacing: 10.0,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    // double percentage =
                                    //     double.parse(washinglist[index].price) /
                                    //         100 *
                                    //         20;

                                    // double percentprice =
                                    //     double.parse(washinglist[index].price) -
                                    //         percentage;

                                    return GestureDetector(
                                        onTap: () {
                                          Get.to(ServiceDetailScreen(
                                              serviceModel: ServiceModel(
                                                  discount: washinglist[index]
                                                      .discount,
                                                  cartImg: washinglist[index]
                                                      .cartImg,
                                                  mainservicename:
                                                      washinglist[index]
                                                          .mainservicename,
                                                  specificservicename:
                                                      washinglist[index]
                                                          .specificservicename,
                                                  price:
                                                      washinglist[index].price,
                                                  backgroundImg:
                                                      washinglist[index]
                                                          .backgroundImg,
                                                  description:
                                                      washinglist[index]
                                                          .description,
                                                  imgsubheading:
                                                      washinglist[index]
                                                          .imgsubheading)));
                                        },
                                        child: Stack(
                                          children: [
                                            Container(
                                                padding: const EdgeInsets.only(
                                                    top: 15,
                                                    left: 10,
                                                    right: 10),
                                                height: 200,
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    color: Colors.black87),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                            washinglist[index]
                                                                .backgroundImg,
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        washinglist[index]
                                                            .specificservicename,
                                                        maxLines: 2,
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                'poppinz',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "From ₹ ${washinglist[index].price}",
                                                        //  ${percentprice.toStringAsFixed(2)}",
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                'poppinz',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            color: Colors.white,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                                                    '${washinglist[index].discount}%',
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ))
                                          ],
                                        ));
                                  },
                                  shrinkWrap: true,
                                ),
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: SpinKitFadingCircle(
                                  color: Colors.white,
                                  size: 50.0,
                                ),
                              );
                            } else {
                              return const Text(
                                'No Data',
                                style: TextStyle(color: Colors.white),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container(); // or any other widget you want to display when name length is not greater than 2
                }
              },
            );
          } else if (snap.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SpinKitFadingCircle(
                color: Colors.white,
                size: 50.0,
              ),
            );
          } else {
            return const Text(
              'No Data',
              style: TextStyle(color: Colors.black),
            );
          }
        },
      ),
    );
  }
}
