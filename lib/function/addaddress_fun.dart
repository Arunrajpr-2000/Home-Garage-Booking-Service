import 'dart:developer';

import 'package:accent_service_app/common/snackbar.dart';
import 'package:accent_service_app/model/profile_model.dart';
import 'package:accent_service_app/view/menu_screen/menu_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future addAddressFun({required ProfileModel profileModel, context}) async {
  final userdoc =
      FirebaseFirestore.instance.collection('users').doc(currentuser);

  final json = profileModel.toJson();

  await userdoc.set(json);
  Utils.showSnackBar(context: context, text: 'Profile Updated');
  log('Address Addded');
}
