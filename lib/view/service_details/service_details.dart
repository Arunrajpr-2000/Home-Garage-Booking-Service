import 'package:accent_service_app/common/const.dart';
import 'package:accent_service_app/model/service_model.dart';
import 'package:accent_service_app/view/choose_booking_time/choose_booking_time.dart';
import 'package:accent_service_app/view/service_details/pricewidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ServiceDetailScreen extends StatelessWidget {
  ServiceDetailScreen({Key? key, required this.serviceModel}) : super(key: key);
  ServiceModel serviceModel;
  @override
  Widget build(BuildContext context) {
    // var service = Service.getdata(name);
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.2,
      //   leading: IconButton(
      //       onPressed: () {
      //         Get.back();
      //       },
      //       icon: const Icon(
      //         Icons.arrow_back_ios_new,
      //         color: Colors.black,
      //       )),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: Stack(children: [
                Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(serviceModel.backgroundImg),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: null),
                Positioned(
                    top: 15,
                    left: 10,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_circle_left_rounded,
                        color: Colors.white,
                        size: 34,
                      ),
                    )),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          serviceModel.mainservicename,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
            kheight20,
            const Row(
              children: [
                k10width,
                Icon(
                  Icons.shopping_cart_rounded,
                  color: Colors.blue,
                ),
                Text(
                  'Shopping',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                )
              ],
            ),
            ChoosePriceWidget(
              ontap: () {},
              heading: serviceModel.specificservicename,
              price: serviceModel.price,
              subheading: serviceModel.imgsubheading,
              carting: serviceModel.cartImg ??
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkBARPjJ2bCuz8yUCkxYhXz1kzDdAWswxMaw4VpKM2jdEFzyS-1iwshnRN_p6dBpvO3yM&usqp=CAU',
            ),
            kheight10,
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            kheight10,
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(serviceModel.description,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 14),
                  textAlign: TextAlign.left),
            ),
            k20height,
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 0),
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () async {
                        Get.to(BookingDateTime(
                          serviceModel: serviceModel,
                        ));
                      },
                      child: const Text(
                        'Add Details Of your service',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
            ),
            k20height
          ],
        ),
      ),
    );
  }
}
