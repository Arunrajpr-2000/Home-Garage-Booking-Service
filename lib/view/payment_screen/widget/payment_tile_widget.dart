import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PaymentMethodsTile extends StatelessWidget {
  PaymentMethodsTile(
      {Key? key,
      this.title,
      this.imageUrl,
      this.radiobutton,
      required this.onTap})
      : super(key: key);
  final String? title;
  final String? imageUrl;
  final Widget? radiobutton;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8.0),
        ),
        width: 300,
        child: ListTile(
            onTap: onTap,
            contentPadding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: NetworkImage(imageUrl.toString())),
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff35383F)),
            ),
            tileColor: Colors.transparent,
            title: Text(
              '$title',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 17),
            ),
            trailing: radiobutton),
      ),
    );
  }
}
