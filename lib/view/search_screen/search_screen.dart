import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:accent_service_app/common/const.dart';
import 'package:accent_service_app/model/service_model.dart';
import 'package:accent_service_app/view/service_details/service_details.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class SearchScreen extends StatefulWidget {
  SearchScreen({
    Key? key,
  }) : super(key: key);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchQuery = '';
  List<QueryDocumentSnapshot> _searchResults = [];
  final TextEditingController _searchController = TextEditingController();

  void _performSearch() async {
    if (_searchQuery.isNotEmpty) {
      List<QueryDocumentSnapshot> results =
          await searchMultipleCollections(_searchQuery);
      setState(() {
        _searchResults = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: <Color>[
                Color(0xff74d3d9),
                //  Color.fromARGB(255, 77, 159, 161),
                // Color(0xff2e2e2e),
                // Color(0xff2e2e2e),
                Color(0xff1a1b1f), Color(0xff1a1b1f),

                // Colors.black, Colors.black
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: Column(
            children: [
              // TextField(
              //   onChanged: (value) {
              //     setState(() {
              //       _searchQuery = value.toUpperCase();
              //       _performSearch();
              //     });
              //   },
              //   // onSubmitted: (_) => _performSearch(),
              // ),
              k20height,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: TextField(
                  cursorColor: Colors.black,
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value.toUpperCase();
                      _performSearch();
                    });
                  },
                  decoration: InputDecoration(
                    hoverColor: Colors.deepOrangeAccent,
                    focusColor: Colors.amber,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: 'Search what you need...',
                    suffixIcon: Visibility(
                      visible: _searchController.text.isNotEmpty,
                      child: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => _searchController.clear(),
                      ),
                    ),
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        // Perform the search here
                      },
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 77, 159, 161),
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              k20height,
              Expanded(
                  child: _searchResults.isNotEmpty
                      ? ListView.builder(
                          itemCount: _searchResults.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic>? data = _searchResults[index]
                                .data() as Map<String, dynamic>?;
                            String fieldValue =
                                data!['specificservicename'] as String;
                            String mainservicename =
                                data['mainservicename'] as String;
                            String specificservicename =
                                data['specificservicename'] as String;
                            String price = data['price'] as String;
                            String backgroundImg =
                                data['backgroundImg'] as String;

                            String description = data['description'] as String;
                            String imgsubheading =
                                data['imgsubheading'] as String;
                            return ListTile(
                              onTap: () {
                                Get.to(ServiceDetailScreen(
                                    serviceModel: ServiceModel(
                                        mainservicename: mainservicename,
                                        specificservicename:
                                            specificservicename,
                                        price: price,
                                        backgroundImg: backgroundImg,
                                        description: description,
                                        imgsubheading: imgsubheading)));
                              },
                              title: Text(
                                fieldValue,
                                style: const TextStyle(
                                    fontFamily: 'poppinz',
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          },
                        )
                      : const Center(
                          child: Text(
                            'Search anything',
                            style: TextStyle(
                                fontFamily: 'poppinz',
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
            ],
          ),
        ),
      ),
    );
  }
}

Future<List<QueryDocumentSnapshot>> searchMultipleCollections(
    String query) async {
  List<QueryDocumentSnapshot> results = [];

  // Collection: 'categories' -> Document: 'categories' -> Collection: 'Cleaning'
  QuerySnapshot cleaningSnapshot = await firestore
      .collection('categories')
      .doc('categories')
      .collection('Cleaning')
      .where('specificservicename', isGreaterThanOrEqualTo: query)
      .get();
  results.addAll(cleaningSnapshot.docs);

  // Collection: 'categories' -> Document: 'categories' -> Collection: 'Service'
  QuerySnapshot serviceSnapshot = await firestore
      .collection('categories')
      .doc('categories')
      .collection('Service')
      .where('specificservicename', isGreaterThanOrEqualTo: query)
      .get();
  results.addAll(serviceSnapshot.docs);

  QuerySnapshot washingSnapshot = await firestore
      .collection('categories')
      .doc('categories')
      .collection('Washing')
      .where('specificservicename', isGreaterThanOrEqualTo: query)
      .get();
  results.addAll(washingSnapshot.docs);

  // Sort the results based on relevance to the search query
  results.sort((a, b) {
    Map<String, dynamic>? dataA = a.data() as Map<String, dynamic>?;
    Map<String, dynamic>? dataB = b.data() as Map<String, dynamic>?;
    String fieldValueA = dataA!['specificservicename'] as String;
    String fieldValueB = dataB!['specificservicename'] as String;

    if (fieldValueA.toLowerCase().startsWith(query.toLowerCase())) {
      return -1;
    } else if (fieldValueB.toLowerCase().startsWith(query.toLowerCase())) {
      return 1;
    } else {
      return fieldValueA.compareTo(fieldValueB);
    }
  });

  return results;
}
