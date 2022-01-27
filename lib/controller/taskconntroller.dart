import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_noruzi/model/task.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:login_noruzi/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskController extends GetxController {
  RxBool loading = true.obs;
  RxList<Task> tasks = <Task>[].obs;
  @override
  void onInit() {
    setTask();
    super.onInit();
  }

  setTask() async {
    tasks.clear();
    var url = Uri.parse("https://api-nodejs-todolist.herokuapp.com/task");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString("userToken");
    Map<String, String> header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $userToken"
    };

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      jsonResponse['data'].forEach((element) {
        tasks.add(Task.fromJson(element));
      });
    } else {
      print("ERROR");
    }

    loading.value = false;
  }

  addTask(String description) async {
    var url = Uri.parse("https://api-nodejs-todolist.herokuapp.com/task");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString("userToken");
    Map<String, String> header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $userToken"
    };
    Map<String, String> body = {"description": description};

    // Await the http get response, then decode the json-formatted response.
    var response =
        await http.post(url, body: convert.jsonEncode(body), headers: header);
    if (response.statusCode == 201) {
      var jsonResponse = convert.jsonDecode(response.body);
      tasks.add(Task.fromJson(jsonResponse['data']));
      print("---------$jsonResponse");
      Get.back();
    } else {
      Get.snackbar("ERROR", "please enter correct info",
          backgroundColor: Colors.red);
    }
  }
}
