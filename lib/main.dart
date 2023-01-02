// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_responsive_app/views/signUp_View.dart';

import 'views/login_View.dart';

// ignore: unnecessary_new
void main() => runApp(new GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    ));
