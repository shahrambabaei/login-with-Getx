import 'package:get/get.dart';
import 'package:login_noruzi/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class SplashConntroller extends GetxController {
  @override
  void onInit() {
    
    handleScreen();
    super.onInit();
  }

  void handleScreen() async {
    // await Future.delayed(const Duration(seconds: 2));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString("userToken");

    if (userToken == null) {
      Get.offNamed(Routes.loginScreen);
    } else {
      print("userToken: ${prefs.getString("userToken")}");
      checkUserToken(userToken);
    }
    // Get.offNamed(Routes.homeScreen);
  }



  void checkUserToken(String userToken) async {
  var url = Uri.parse("https://api-nodejs-todolist.herokuapp.com/user/me");
  Map<String, String> header = {
    "Content-Type": "application/json",
    "Authorization": "Bearer $userToken"
  };

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url, headers: header);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse);
    Get.offNamed(Routes.homeScreen);
  } else {
    Get.offNamed(Routes.loginScreen);
  }
}
}


