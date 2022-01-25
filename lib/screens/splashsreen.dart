import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_noruzi/assets/colors.dart';
import 'package:login_noruzi/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    handleScreen();
    return Scaffold(
      backgroundColor: whiteColor,
      body: const Center(
        child: FlutterLogo(
          size: 250,
        ),
      ),
    );
  }

  void handleScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("userToken") == null) {
      Get.offNamed(Routes.loginScreen);
    }
    Get.offNamed(Routes.homeScreen);
  }
}
