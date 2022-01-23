import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_noruzi/assets/colors.dart';

class ButtonWidget extends StatelessWidget {
  late String clickText;
  late bool clickColor;
  ButtonWidget({Key? key, required this.clickText, required this.clickColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: Get.height*.08,
      decoration: BoxDecoration(
          color: clickColor ? blueColor : whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: clickColor
              ? const Border.fromBorderSide(BorderSide.none)
              : Border.all(color: blueColor, width: 2)),
      child: Text(clickText,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: clickColor ? whiteColor : blueColor)),
    );
  }
}
