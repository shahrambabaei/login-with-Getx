import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_noruzi/assets/colors.dart';
import 'package:login_noruzi/widgets/buttonwidget.dart';
import 'package:login_noruzi/widgets/textformwidget.dart';
import 'package:validators/validators.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  var email;
  var password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: Get.height * .32,
            width: Get.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: blueColor,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(20))),
            child: Text("Logo",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: whiteColor)),
          ),
          SizedBox(
            height: Get.height * .17,
          ),
          Container(
              height: Get.height * .51,
              child: Form(
                  key: formKey,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                              height: Get.height * .25,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextFormWidget(
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return "enter email";
                                      } else if (!isEmail(value)) {
                                        return "enter correct email";
                                      } else {
                                        return null;
                                      }
                                    },
                                    prefixicon: Icons.mail,
                                    lableText: "email",
                                    keyboardType: TextInputType.emailAddress,
                                    onSaved: (value) {
                                      email = value;
                                    },
                                  ),
                                  TextFormWidget(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return " enter password";
                                      } else if (value.length < 6) {
                                        return "Password must be 6 characters or more";
                                      } else {
                                        return null;
                                      }
                                    },
                                    suffixicon: Icons.visibility_off_rounded,
                                    prefixicon: Icons.lock,
                                    lableText: "password",
                                    obscureText: true,
                                    keyboardType: TextInputType.text,
                                    onSaved: (value) {
                                      password = value;
                                    },
                                  ),
                                ],
                              )),
                          Container(
                            height: Get.height * .06,
                            child: InkWell(
                                enableFeedback: false,
                                onTap: () {},
                                child: const Text("forget password?",
                                    style: TextStyle(fontSize: 16))),
                          ),
                          Container(
                              height: Get.height * .2,
                              // margin: const EdgeInsets.only(bottom: 5),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        formKey.currentState!.validate();
                                        formKey.currentState!.save();
                                        print("Email: $email");
                                        print("Password: $password");
                                      },
                                      child: ButtonWidget(
                                          clickText: "Login",
                                          clickColor: true)),
                                  InkWell(
                                      onTap: () {
                                        formKey.currentState!.validate();
                                      },
                                      child: ButtonWidget(
                                          clickText: "Sign up",
                                          clickColor: false))
                                ],
                              ))
                        ],
                      ))))
        ],
      )),
    );
  }
}
