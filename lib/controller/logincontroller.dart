import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // @override
  // void onInit() {
  //   emailController = TextEditingController();
  //   passwordController = TextEditingController();
  //   // TODO: implement onInit
  //   super.onInit();
  // }


  // login(email, password) async{
  //   await Future.delayed(Duration(seconds: 2));


  // }

  login(email, password) async {
    var url = Uri.parse("https://api-nodejs-todolist.herokuapp.com/user/login");
    Map<String, String> header = {"Content-Type": "application/json"};
    Map<String, String> body = {"email": "$email", "password": "$password"};
   

    // Await the http get response, then decode the json-formatted response.
    var response =
        await http.post(url, body: convert.jsonEncode(body), headers: header);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      
      print("jsonResponse: $jsonResponse");

      print('Number of books about http.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
