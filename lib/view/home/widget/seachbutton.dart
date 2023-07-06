import 'package:accent_service_app/view/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchButton extends StatefulWidget {
  SearchButton({Key? key}) : super(key: key);

  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  // final TextEditingController _searchController = TextEditingController();

  // @override
  // void dispose() {
  //   _searchController.dispose();
  //   super.dispose();
  // }

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
            leading: Icon(Icons.search_rounded),
            title: Text('search...'),
            onTap: () => Get.to(SearchScreen()),
          )
          // TextField(
          //   enabled: false,

          //   // cursorColor: Colors.blue,
          //   // controller: _searchController,
          //   // onChanged: (value) {
          //   //   setState(() {});
          //   // },
          //   decoration: InputDecoration(
          //     focusColor: Colors.amber,
          //     focusedBorder: InputBorder.none,
          //     enabledBorder: InputBorder.none,
          //     hintText: 'Search what you need...',
          //     // suffixIcon: Visibility(
          //     //   visible: _searchController.text.isNotEmpty,
          //     //   child: IconButton(
          //     //     icon: Icon(Icons.clear),
          //     //     onPressed: () => _searchController.clear(),
          //     //   ),
          //     // ),
          //     prefixIcon: IconButton(
          //       icon: Icon(Icons.search),
          //       onPressed: () {
          //         // Perform the search here
          //       },
          //     ),
          //     border: OutlineInputBorder(
          //       borderSide: BorderSide(
          //         color: Color.fromARGB(255, 77, 159, 161),
          //       ),
          //       borderRadius: BorderRadius.circular(20.0),
          //     ),
          //   ),
          // ),
          ),
    );
  }
}
