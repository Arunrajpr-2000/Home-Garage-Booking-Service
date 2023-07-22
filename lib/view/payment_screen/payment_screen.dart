import 'dart:developer';
import 'package:accent_service_app/common/const.dart';
import 'package:accent_service_app/common/snackbar.dart';
import 'package:accent_service_app/function/add_order_fun.dart';
import 'package:accent_service_app/model/order_model.dart';
import 'package:accent_service_app/model/profile_model.dart';
import 'package:accent_service_app/model/service_model.dart';
import 'package:accent_service_app/view/menu_screen/menu_screen.dart';
import 'package:accent_service_app/view/payment_screen/widget/payment_tile_widget.dart';
import 'package:accent_service_app/view/payment_screen/widget/total_price_bottom_widget.dart';
import 'package:accent_service_app/view/profile_screen/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';

// ignore: must_be_immutable
class PaymentScreen extends StatefulWidget {
  PaymentScreen(
      {super.key,
      required this.serviceModel,
      required this.availabledate,
      required this.availabletime,
      required this.estimatedetails});

  ServiceModel serviceModel;
  String availabledate;
  String availabletime;
  String estimatedetails;
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _value = 1;
  // Razorpay razorpay = Razorpay();
  TextEditingController localareaController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  TextEditingController stateController = TextEditingController();
  TextEditingController districtController = TextEditingController();

  TextEditingController pincodeController = TextEditingController();

  // Future<String> generateOrderId(int amount) async {
  //   var url = 'https://api.razorpay.com/v1/orders'; // Razorpay API endpoint

  //   // Set your Razorpay API key and secret
  //   var keyId = 'rzp_test_wt05nGk9MinzK9';
  //   var keySecret = 'ZCdkevqGthAq2bWVGicvEOIA';

  //   // Create the request headers
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization':
  //         'Basic ${base64Encode(utf8.encode('$keyId:$keySecret'))}',
  //   };

  //   // Create the request body
  //   var body = jsonEncode({
  //     'amount':
  //         amount, // Amount in paise (e.g., for ₹10, 'amount' will be 1000)
  //     'currency': 'INR', // Change to your desired currency
  //   });

  //   // Make the API request
  //   var response =
  //       await http.post(Uri.parse(url), headers: headers, body: body);

  //   if (response.statusCode == 200) {
  //     var responseData = jsonDecode(response.body);
  //     var orderId = responseData['id'];
  //     return orderId;
  //   } else {
  //     throw Exception('Failed to generate orderId');
  //   }
  // }

  // void initiatePayment(int amount, String email, String contact) async {
  //   try {
  //     int amountinRs = amount * 100;
  //     String orderId = await generateOrderId(amountinRs);
  //     // Use the orderId as needed
  //     print('Generated Order ID: $orderId');
  //     // Start the payment process using the obtained orderId
  //     startPayment(orderId, amount, email, contact);
  //   } catch (e) {
  //     print('Error: $e');
  //     // Handle error case
  //   }
  // }

  // void startPayment(String orderId, int amount, String email, String contact) {
  //   // Use the obtained orderId for payment initiation
  //   var options = {
  //     'key': 'rzp_test_wt05nGk9MinzK9',
  //     'amount': amount,
  //     'name': 'NoDuster',
  //     'description': 'Demo',
  //     'order_id': orderId,
  //     'prefill': {'contact': contact, 'email': email},
  //     'external': {
  //       'wallets': ['paytm']
  //     }
  //   };

  //   try {
  //     razorpay.open(options);
  //   } catch (e) {
  //     print('Error: $e');
  //     // Handle error case
  //   }
  // }

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
  //     razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  //     razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  //   });
  //   super.initState();
  // }

  // void _handlePaymentSuccess(PaymentSuccessResponse response) {
  //   log(response.toString());
  //   log(response.orderId.toString());
  //   log(response.paymentId.toString());
  //   log(response.signature.toString());

  //   Get.back();
  //   // verifyS
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text(response.toString())));
  // }

  // void _handlePaymentError(PaymentFailureResponse response) {
  //   log(response.toString());
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text(response.toString())));
  // }

  // void _handleExternalWallet(ExternalWalletResponse response) {
  //   log(response.toString());
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text(response.toString())));
  // }

  // @override
  // void dispose() {
  //   razorpay.clear();
  //   super.dispose();
  // }

  String? username;

  String? phonenumber;
  String? imgurl;

  String? email;
  String? city;
  String? nearby;
  String? state;
  String? street;
  String? postal;
  String? address;

  Future<void> getUserDetails() async {
    // final userId = 'your_user_id_here';

    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentuser)
          .get();

      if (userDoc.exists) {
        final userData = userDoc.data();
        // Access specific fields from the user document
        setState(() {
          username = userData!['username'];

          phonenumber = userData['phonenumber'];
          imgurl = userData['image'];
          email = userData['email'];
          city = userData['cityordistrict'];
          nearby = userData['nearby'];
          state = userData['state'];
          street = userData['street'];
          postal = userData['postalcode'];
          address = '$street, $city, $state, $postal nearby $nearby';
        });
        // log(address.toString());

        // Do something with the user details
      } else {
        log('User document does not exist');
      }
    } catch (e) {
      log('Error retrieving user details: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    getUserDetails();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Order Confirmation",
          style: TextStyle(
            fontFamily: "poppinz",
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xff74d3d9),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: <Color>[
                Color(0xff74d3d9),
                Color(0xff1a1b1f),
                Color(0xff1a1b1f),
              ]),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                k20height,
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    'Your current Address',
                    style: TextStyle(
                      fontFamily: "poppinz",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                k20height,
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 70,
                        height: 60,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQexqdCnK9weRz7K3C76SS_ITD14CpgNEnJUpJ27sf4uOZK2ucH75UVProMrUzg6opnpXg&usqp=CAU',
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                      ),
                      // kwidth20,
                      Container(
                        padding: const EdgeInsets.only(left: 15),
                        width: 180,
                        child: Text(
                          street == null ||
                                  city == null ||
                                  state == null ||
                                  postal == null ||
                                  nearby == null
                              ? 'Add Address'
                              : address.toString(),
                          style: const TextStyle(
                            fontFamily: "poppinz",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          maxLines: 4,
                        ),
                      ),
                      // kwidth20,
                      IconButton(
                          onPressed: () {
                            Get.to(ProfileScreen(
                                profileModel: ProfileModel(
                                    phonenumber: currentuser.toString(),
                                    cityordistrict: city ?? '',
                                    email: email ?? '',
                                    nearby: nearby ?? '',
                                    postalcode: postal ?? '',
                                    state: state ?? '',
                                    street: street ?? '',
                                    username: username ?? '',
                                    image: imgurl)));
                          },
                          icon: const CircleAvatar(
                            radius: 20,
                            child: Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                          )),
                    ],
                  ),
                ),
                k30height,
                Center(
                  child: PaymentMethodsTile(
                    onTap: () {},
                    imageUrl:
                        'https://img.freepik.com/premium-vector/cash-delivery_569841-162.jpg?w=2000',
                    title: 'Cash on Delivery',
                    radiobutton: Radio<int>(
                        fillColor: MaterialStateProperty.all(Colors.white),
                        activeColor: Colors.white,
                        // fillColor:,
                        value: 1,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        }),
                  ),
                ),
                k20height,
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: TotalPriceBottomWidget(
                onTap: () async {
                  street == null ||
                          city == null ||
                          state == null ||
                          postal == null ||
                          nearby == null
                      ? Utils.showSnackBar(
                          context: context, text: 'Please Fill address')
                      : await addOrderFun(
                          orderModel: OrderModel(
                              availabledate: widget.availabledate,
                              availabletime: widget.availabletime,
                              estimatedetails: widget.estimatedetails,
                              ispending: true,
                              isaccepted: false,
                              isworkstarted: false,
                              isadminapproved: false,
                              mainservicename:
                                  widget.serviceModel.mainservicename,
                              specificservicename:
                                  widget.serviceModel.specificservicename,
                              price: widget.serviceModel.price,
                              orderid: randomAlphaNumeric(8),
                              isDelivered: false,
                              isCanceled: false,
                              datetime: DateTime.now().toString(),
                              paymentmethod: 'COD',
                              userphonenumber: currentuser.toString(),
                              address: address,
                              nearby: nearby,
                              username: username,
                              userimg: imgurl));
                },
                title: 'Cost From',
                totalPrice: widget.serviceModel.price,
                selectPayments: 'Confirm Payment',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
