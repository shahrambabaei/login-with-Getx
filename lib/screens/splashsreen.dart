import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_noruzi/assets/colors.dart';
import 'package:login_noruzi/controller/splashcontroller.dart';
import 'package:login_noruzi/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashConntroller());
    return Scaffold(
      backgroundColor: whiteColor,
      body: const Center(
        child: FlutterLogo(
          size: 250,
        ),
      ),
    );
  }
}
