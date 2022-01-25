import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:login_noruzi/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  // @override

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  login(email, password) async {
    var url = Uri.parse("https://api-nodejs-todolist.herokuapp.com/user/login");
    Map<String, String> header = {"Content-Type": "application/json"};
    Map<String, String> body = {"email": "$email", "password": "$password"};

    // Await the http get response, then decode the json-formatted response.
    var response =
        await http.post(url, body: convert.jsonEncode(body), headers: header);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("userToken", jsonResponse["token"]);
      Get.offNamed(Routes.homeScreen);

      print("jsonResponse: $jsonResponse");

      print('Number of books about http.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
      Get.snackbar(
        "ERROR",
        "please enter correct info",
        titleText: const Text(
          "ERROR",
          style: TextStyle(color: Colors.black),
        ),
        messageText: const Text(
          "please enter correct info",
          style: TextStyle(color: Colors.black),
        ),
        icon: const Icon(
          Icons.error_outlined,
          color: Colors.red,
        ),
        backgroundColor: Colors.teal.shade300,
      );
    }
  }
}
