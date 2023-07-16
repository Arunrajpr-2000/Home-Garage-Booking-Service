import 'package:accent_service_app/common/const.dart';
import 'package:accent_service_app/view/home/banner2.dart';
import 'package:accent_service_app/view/home/widget/banners.dart';
import 'package:accent_service_app/view/home/widget/category_widget.dart';
import 'package:accent_service_app/view/home/widget/cleaning_stream/cleaning_stream_widget.dart';
import 'package:accent_service_app/view/home/widget/seachbutton.dart';
import 'package:accent_service_app/view/home/widget/service_stream/service_stream_widget.dart';
import 'package:accent_service_app/view/home/widget/washing_stream/washing_stream_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchButton(),
          PageViewWidget(isneedtext: true),
          servicetitle('Categories'),
          k10height,
          const Center(child: SizedBox(height: 50, child: CategoryWidget())),
          k10height,
          servicetitle('Cleaning Services'),
          const SizedBox(height: 210, child: CleaningStream()),
          servicetitle('Services'),
          const SizedBox(height: 210, child: ServiceStream()),
          PageViewWidget2(),
          servicetitle('Washing Services'),
          const SizedBox(height: 210, child: WashingStream()),
        ],
      ),
    );
  }

  Widget servicetitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: Text(
        text,
        style: const TextStyle(
            fontFamily: 'poppinz',
            overflow: TextOverflow.ellipsis,
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
