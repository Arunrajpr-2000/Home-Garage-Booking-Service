import 'dart:async';

import 'package:accent_service_app/common/const.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PageViewWidget2 extends StatefulWidget {
  const PageViewWidget2({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PageViewWidget2State createState() => _PageViewWidget2State();
}

class _PageViewWidget2State extends State<PageViewWidget2> {
  List<String> bannerImages = [];
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    fetchBannerImages();
    startAutoPageChange();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startAutoPageChange() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      final nextPage = (_currentPage + 1) % bannerImages.length;
      if (_currentPage == bannerImages.length - 1) {
        // Stop the auto-scrolling when the last image is reached
        _timer?.cancel();
      } else {
        setState(() {
          _currentPage = nextPage;
        });
      }
    });
  }

  void fetchBannerImages() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('banner2').get();

    final images = snapshot.docs.map((doc) => doc['img'] as String).toList();

    setState(() {
      bannerImages = images;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (bannerImages.isEmpty)
          const Center(
            child: SpinKitFadingCircle(
              color: Colors.white,
              size: 50.0,
            ),
          )
        else
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              k20height,
              SizedBox(
                height: 130,
                width: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: bannerImages.length,
                  options: CarouselOptions(
                    viewportFraction: 1,
                    //carouselController: CarouselController(),
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayCurve: Curves.easeInOut,
                    aspectRatio: MediaQuery.of(context).size.width /
                        MediaQuery.of(context).size.height,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                  ),
                  itemBuilder: (context, index, realIndex) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(bannerImages[index]),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              k10height,
              Center(
                child: DotsIndicator(
                  dotsCount: bannerImages.length,
                  position: _currentPage,
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: Colors.grey,
                    activeColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
