import 'package:accent_service_app/view/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: ListTile(
            leading: const Icon(Icons.search_rounded),
            title: const Text('search...'),
            onTap: () => Get.to(const SearchScreen()),
          )),
    );
  }
}
