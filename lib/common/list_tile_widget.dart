import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListTileWidget extends StatelessWidget {
  ListTileWidget({
    Key? key,
    this.iconColor,
    this.trailingButton,
    this.leadIcon,
    this.ontap,
    this.title,
  }) : super(key: key);

  final IconData? leadIcon;

  final Color? iconColor;
  final String? title;
  void Function()? ontap;
  final Widget? trailingButton;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(leadIcon, color: iconColor),
        title: Text(
          '$title',
          style: TextStyle(
            color: iconColor,
            fontFamily: "poppinz",
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: ontap,
        trailing: trailingButton);
  }
}
