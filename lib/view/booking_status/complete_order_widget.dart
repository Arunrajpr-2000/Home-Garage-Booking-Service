import 'package:accent_service_app/common/const.dart';
import 'package:flutter/material.dart';

class CompletedOrder extends StatelessWidget {
  const CompletedOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) => k20height,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            k10height,
                            Text(
                              "Service",
                              style: TextStyle(
                                fontFamily: "poppinz",
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "Kitchen Cleaning",
                              style: TextStyle(
                                fontFamily: "poppinz",
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            k20height,
                            Text(
                              "Booking ID",
                              style: TextStyle(
                                fontFamily: "poppinz",
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "7817281",
                              style: TextStyle(
                                fontFamily: "poppinz",
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            k20height,
                            Text(
                              "Status",
                              style: TextStyle(
                                fontFamily: "poppinz",
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "Completed",
                              style: TextStyle(
                                fontFamily: "poppinz",
                                fontSize: 15,
                                color: Colors.green,
                              ),
                            ),
                            k10height
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue[100],
                          ),
                          height: 120,
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "04",
                                      style: TextStyle(
                                          fontFamily: "poppinz",
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "August",
                                      style: TextStyle(
                                          fontFamily: "poppinz",
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "2023",
                                      style: TextStyle(
                                          fontFamily: "poppinz",
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              k10width,
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 90,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'asset/pexels-mark-mccammon-2724748.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}
