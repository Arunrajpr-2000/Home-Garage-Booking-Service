// import 'dart:core';

import 'package:flutter/material.dart';

class TextfieldContainer extends StatelessWidget {
  TextfieldContainer(
      {Key? key,
      this.controller,
      this.hinttext,
      this.trailingIcon,
      this.validator,
      this.initialValue,
      this.onTap,
      this.errorText,
      this.keyboardType,
      this.leadingIcon,
      this.onChanged})
      : super(key: key);

  TextEditingController? controller = TextEditingController();
  String? hinttext, errorText;
  Icon? leadingIcon;
  String? initialValue;
  TextInputType? keyboardType;
  IconButton? trailingIcon;
  void Function()? onTap;

  // void OnChange;
  void Function(String)? onChanged;

  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 65,
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
        leading: leadingIcon,
        title: TextFormField(
          onTap: onTap,
          initialValue: initialValue,
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          onChanged: onChanged,
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          controller: controller,
          decoration: InputDecoration(
            errorText: errorText,
            border: InputBorder.none,
            hintText: hinttext,
            hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
        trailing: trailingIcon,
      ),
    );
  }
}
