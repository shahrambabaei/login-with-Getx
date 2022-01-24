import 'package:flutter/material.dart';
import 'package:login_noruzi/assets/colors.dart';

class TextFormWidget extends StatelessWidget {
  final IconData prefixicon;
  final IconData? suffixicon;
  final String lableText;
  final bool obscureText;
  final TextEditingController controller;
  final void Function(String?) onSaved;
  final String? Function(String?) validator;
  final TextInputType keyboardType;
  const TextFormWidget(
      {Key? key,
      required this.prefixicon,
      required this.lableText,
      required this.keyboardType,
      this.suffixicon,
      this.obscureText = false,
      required this.validator,
      required this.controller,
      required this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onSaved: onSaved,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          filled: true,
          // fillColor: ,

          prefixIcon: Icon(
            prefixicon,
            color: blueColor,
          ),
          suffixIcon: Icon(
            suffixicon,
            color: blueColor,
          ),
          labelText: lableText,
          labelStyle: TextStyle(color: blueColor),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: blueColor),
              borderRadius: BorderRadius.circular(15))),
    );
  }
}
