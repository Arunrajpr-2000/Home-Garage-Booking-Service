import 'dart:developer';

import 'package:accent_service_app/common/const.dart';
import 'package:accent_service_app/common/snackbar.dart';
import 'package:accent_service_app/function/addaddress_fun.dart';
import 'package:accent_service_app/function/image_fun.dart';
import 'package:accent_service_app/model/profile_model.dart';
import 'package:accent_service_app/view/menu_screen/menu_screen.dart';
import 'package:accent_service_app/view/payment_screen/widget/textfield_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key, required this.profileModel});
  ProfileModel profileModel;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? imgurl;
  // =
  // 'https://www.goodmorningimagesdownload.com/wp-content/uploads/2021/12/Best-Quality-Profile-Images-Pic-Download-2023.jpg';

  @override
  void initState() {
    super.initState();
    imgurl = widget.profileModel.image ??
        'https://www.goodmorningimagesdownload.com/wp-content/uploads/2021/12/Best-Quality-Profile-Images-Pic-Download-2023.jpg';
  }

  @override
  Widget build(BuildContext context) {
    final _usernameController =
        TextEditingController(text: '${widget.profileModel.username}');
    final _emailController =
        TextEditingController(text: '${widget.profileModel.email}');
    final _cityController =
        TextEditingController(text: '${widget.profileModel.cityordistrict}');
    final _nearbyController =
        TextEditingController(text: '${widget.profileModel.nearby}');
    final _stateController =
        TextEditingController(text: '${widget.profileModel.state}');
    final _streetController =
        TextEditingController(text: '${widget.profileModel.street}');
    final _postalController =
        TextEditingController(text: '${widget.profileModel.postalcode}');

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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                k30height,
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          // NetworkImage(user.photoURL!)
                          NetworkImage(imgurl.toString()),
                      radius: 80,
                    ),
                    Positioned(
                      bottom: 5,
                      right: 2,
                      child: InkWell(
                        onTap: () {
                          setState(() async {
                            final imageurl = await Images.getimage();
                            //image.add(imageurl.toString());
                            setState(() {});
                            imgurl = imageurl!;

                            log(imageurl.toString());
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.add_a_photo_rounded,
                            size: 23,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                k20height,
                TextfieldContainer(
                  controller: _usernameController,
                  leadingIcon: Icon(Icons.person, color: Colors.white),
                  hinttext: 'Enter UserName',
                ),
                k20height,
                TextfieldContainer(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  leadingIcon: Icon(Icons.email, color: Colors.white),
                  hinttext: 'Enter Email',
                ),
                k20height,
                TextfieldContainer(
                  controller: _streetController,
                  leadingIcon: Icon(Icons.location_pin, color: Colors.white),
                  hinttext: 'Enter Street',
                ),
                k20height,
                TextfieldContainer(
                  controller: _cityController,
                  leadingIcon: Icon(Icons.location_pin, color: Colors.white),
                  hinttext: 'Enter City/District',
                ),
                k20height,
                TextfieldContainer(
                  controller: _stateController,
                  leadingIcon: Icon(Icons.location_pin, color: Colors.white),
                  hinttext: 'Enter state',
                ),
                k20height,
                TextfieldContainer(
                  keyboardType: TextInputType.phone,
                  controller: _postalController,
                  leadingIcon: Icon(Icons.location_pin, color: Colors.white),
                  hinttext: 'Enter Postal code',
                ),
                k20height,
                TextfieldContainer(
                  controller: _nearbyController,
                  leadingIcon: Icon(Icons.location_pin, color: Colors.white),
                  hinttext: 'Enter Nearby location',
                ),
                k30height,
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          if (_usernameController.text.isEmpty ||
                              _emailController.text.isEmpty ||
                              _streetController.text.isEmpty ||
                              _cityController.text.isEmpty ||
                              _stateController.text.isEmpty ||
                              _postalController.text.isEmpty ||
                              _nearbyController.text.isEmpty) {
                            //
                            Utils.showSnackBar(
                                context: context,
                                text: 'Please fill all fields');
                          } else {
                            addAddressFun(
                                profileModel: ProfileModel(
                                    phonenumber: currentuser.toString(),
                                    cityordistrict: _cityController.text,
                                    email: _emailController.text,
                                    nearby: _nearbyController.text,
                                    postalcode: _postalController.text,
                                    state: _stateController.text,
                                    street: _streetController.text,
                                    username: _usernameController.text,
                                    image: imgurl));
                            Get.back();
                          }
                        },
                        child: Text(
                          'Update Profile',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )),
                  ),
                ),
                k20height
              ],
            ),
          ),
        ),
      ),
    );
  }
}
