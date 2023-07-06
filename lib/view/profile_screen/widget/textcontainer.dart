import 'package:flutter/material.dart';

class Textcontainer extends StatelessWidget {
  Textcontainer(
      {Key? key,
      required this.text,
      this.icondata,
      this.icons,
      this.textcolor,
      this.onTap})
      : super(key: key);

  String text;
  IconData? icondata;
  Icon? icons;
  Color? textcolor;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 55,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              // offset: Offset(0, 3),
            ),
          ],
          color: const Color(0xff1F222B),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: onTap,
        leading: icons ??
            Icon(
              icondata,
              color: Colors.white,
            ),
        title: Text(
          text,
          style: TextStyle(
            color: textcolor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
