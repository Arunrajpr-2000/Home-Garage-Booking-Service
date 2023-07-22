import 'package:flutter/material.dart';

class MenuTileWidget extends StatelessWidget {
  const MenuTileWidget(
      {super.key,
      required this.iconData,
      required this.title,
      this.icon,
      required this.onTap});
  final String title;
  final IconData iconData;
  final Widget? icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Center(child: icon ?? Icon(iconData))),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: "poppinz",
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_circle_right_sharp,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
