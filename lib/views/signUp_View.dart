import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login_responsive_app/controller/ui_controller.dart';
import 'package:lottie/lottie.dart';

import '../constants.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController gmailNameController = TextEditingController();
  TextEditingController passwordNameController = TextEditingController();

  final _key = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    gmailNameController.dispose();
    passwordNameController.dispose();
  }

  UiController uiController = Get.put(UiController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      // ignore: prefer_const_constructors
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        // ignore: prefer_const_constructors
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: Container(
                        color: Colors.red,
                      )),
                  Expanded(
                      child: Container(
                    color: Colors.yellow,
                  ))
                ],
              );
            } else {
              return _buildSmallScreen(size);
            }
          },
        ),
      ),
    );
  }

  Center _buildSmallScreen(Size size) => Center(child: _buildMainBody(size));

  Column _buildMainBody(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Lottie.asset(
          'assets/wave-line.json',
          width: size.width,
          height: size.height * 0.2,
          animate: true,
        ),
        SizedBox(height: size.height * 0.03),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            "Sign-Up",
            style: loginTitleStyle(size),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            "Create a new Account",
            style: loginSubtitleStyle(size),
          ),
        ),
        SizedBox(height: size.height * 0.03),
        Form(
            key: _key,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  //Username Field
                  TextFormField(
                    controller: userNameController,
                    style: textFormFieldStyle(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username cannot be empty";
                      } else if (value.length < 4) {
                        return "Username must be at least 4 characters";
                      } else if (value.length > 13) {
                        return "Maximum must be at least 13 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  //Gmail Field
                  TextFormField(
                    controller: gmailNameController,
                    style: textFormFieldStyle(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_rounded),
                      hintText: "Gmail",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Gmail address";
                      } else if (!value.endsWith('@gmail.com')) {
                        return "Please Enter a valid Gmail address";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  //Password Field
                  Obx(
                    () => TextFormField(
                      controller: passwordNameController,
                      style: textFormFieldStyle(),
                      obscureText: uiController.isObscure.value,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_open),
                        suffixIcon: IconButton(
                          icon: Icon(
                            uiController.isObscure.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            uiController.isObscure.value =
                                !uiController.isObscure.value;
                          },
                        ),
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Your Password";
                        } else if (value.length < 4) {
                          return "Password must be at least 6 characters";
                        } else if (value.length > 13) {
                          return "Maximum must be at least 13 characters";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                ],
              ),
            )),
        SizedBox(
          height: size.height * 0.01,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Creating an account means you\'re okay with our Terms of Service and our Privacy Policy',
            style: loginTermsAndPrivacyStyle(size),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          child: _buildButton(size),
        )
      ],
    );
  }

  SizedBox _buildButton(Size size) {
    return SizedBox(
      width: size.width,
      height: 55,
      child: ElevatedButton(
          onPressed: () {
            if (_key.currentState!.validate()) {
              //Sign-Up

            }
          },
          child: const Text("Sign Up")),
    );
  }
}
