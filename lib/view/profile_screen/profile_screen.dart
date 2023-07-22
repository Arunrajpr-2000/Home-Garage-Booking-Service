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

// ignore: must_be_immutable
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
    final usernameController =
        TextEditingController(text: '${widget.profileModel.username}');
    final emailController =
        TextEditingController(text: '${widget.profileModel.email}');
    final cityController =
        TextEditingController(text: '${widget.profileModel.cityordistrict}');
    final nearbyController =
        TextEditingController(text: '${widget.profileModel.nearby}');
    final stateController =
        TextEditingController(text: '${widget.profileModel.state}');
    final streetController =
        TextEditingController(text: '${widget.profileModel.street}');
    final postalController =
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
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(8),
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
                  controller: usernameController,
                  leadingIcon: const Icon(Icons.person, color: Colors.white),
                  hinttext: 'Enter UserName',
                ),
                k20height,
                TextfieldContainer(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  leadingIcon: const Icon(Icons.email, color: Colors.white),
                  hinttext: 'Enter Email',
                ),
                k20height,
                TextfieldContainer(
                  controller: streetController,
                  leadingIcon:
                      const Icon(Icons.location_pin, color: Colors.white),
                  hinttext: 'Enter Street',
                ),
                k20height,
                TextfieldContainer(
                  controller: cityController,
                  leadingIcon:
                      const Icon(Icons.location_pin, color: Colors.white),
                  hinttext: 'Enter City/District',
                ),
                k20height,
                TextfieldContainer(
                  controller: stateController,
                  leadingIcon:
                      const Icon(Icons.location_pin, color: Colors.white),
                  hinttext: 'Enter state',
                ),
                k20height,
                TextfieldContainer(
                  keyboardType: TextInputType.phone,
                  controller: postalController,
                  leadingIcon:
                      const Icon(Icons.location_pin, color: Colors.white),
                  hinttext: 'Enter Postal code',
                ),
                k20height,
                TextfieldContainer(
                  controller: nearbyController,
                  leadingIcon:
                      const Icon(Icons.location_pin, color: Colors.white),
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
                          if (usernameController.text.isEmpty ||
                              emailController.text.isEmpty ||
                              streetController.text.isEmpty ||
                              cityController.text.isEmpty ||
                              stateController.text.isEmpty ||
                              postalController.text.isEmpty ||
                              nearbyController.text.isEmpty) {
                            //
                            Utils.showSnackBar(
                                context: context,
                                text: 'Please fill all fields');
                          } else {
                            addAddressFun(
                                profileModel: ProfileModel(
                                    phonenumber: currentuser.toString(),
                                    cityordistrict: cityController.text,
                                    email: emailController.text,
                                    nearby: nearbyController.text,
                                    postalcode: postalController.text,
                                    state: stateController.text,
                                    street: streetController.text,
                                    username: usernameController.text,
                                    image: imgurl));
                            Get.back();
                          }
                        },
                        child: const Text(
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
