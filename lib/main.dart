import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_noruzi/routes.dart';
import 'package:login_noruzi/screens/homescreen.dart';
import 'package:login_noruzi/screens/loginscreen.dart';
import 'package:login_noruzi/screens/splashsreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        Routes.splashScreen: (c) =>const SplashScreen(),
        Routes.loginScreen: (c) => LoginScreen(),
        Routes.homeScreen: (c) => HomeScreen()
      },
      initialRoute: Routes.splashScreen,
    );
  }
}
