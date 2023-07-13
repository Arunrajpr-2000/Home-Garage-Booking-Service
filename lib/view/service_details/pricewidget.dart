import 'package:accent_service_app/common/const.dart';
import 'package:flutter/material.dart';

class ChoosePriceWidget extends StatelessWidget {
  const ChoosePriceWidget(
      {Key? key,
      required this.price,
      required this.heading,
      required this.subheading,
      required this.carting,
      required this.ontap})
      : super(key: key);

  final String heading;
  final String subheading;
  final String price;
  final String carting;

  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kheight20,
              SizedBox(
                width: 250,
                child: Text(
                  heading,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.left,
                  maxLines: 2,
                ),
              ),
              // kheight10,
              SizedBox(
                width: 200,
                child: Text(subheading,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                    maxLines: 3,
                    textAlign: TextAlign.left),
              ),
              kheight20,
              Text('₹ $price Onwards',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                  textAlign: TextAlign.left),
            ],
          ),
          Stack(children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(carting),
                    fit: BoxFit.fill,
                  ),
                ),
                height: 90,
                width: 90,
                child: null),
            Positioned(
                bottom: 0,
                top: 65,
                right: 5,
                left: 5,
                child: ElevatedButton(
                  onPressed: () {
                    ontap();
                    // SampleController sampleCtrl = Get.put(SampleController());
                    // sampleCtrl.convert(Cars.getwashdetails("hatchback"));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                ))
          ]),
          kheight20,
        ],
      ),
    );
  }
}
