import 'package:accent_service_app/common/const.dart';
import 'package:accent_service_app/view/inside_category/inside_category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('categories').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              separatorBuilder: (context, index) => k10width,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                QueryDocumentSnapshot documentsnampshot =
                    snapshot.data!.docs[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(InsideCate(cate: documentsnampshot['name']));
                  },
                  child: Container(
                    width: 100,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.withOpacity(0.5),
                      //     spreadRadius: 2,
                      //     blurRadius: 5,
                      //     // offset:
                      //     //     const Offset(0, 3), // Shadow position (x, y)
                      //   ),
                      // ],
                    ),
                    child: Center(
                      child: Text(
                        documentsnampshot['name'],
                        style: const TextStyle(
                          color: Color(0xff74d3d9),
                          fontSize: 15,
                          // fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: SpinKitFadingCircle(
                color: Colors.white, // Customize the color of the spinner
                size: 50.0, // Customize the size of the spinner
              ),
            );
          }
        },
      ),
    );
  }
}
