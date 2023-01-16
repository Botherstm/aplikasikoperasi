// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'model/list_users_model.dart';
import 'pages/login/login.dart';

void main() async {
  ListUsersModel user;
  runApp(
    const MaterialApp(
        // home: user == null ? Login() : MyApp(),
        home: Login(),
        debugShowCheckedModeBanner: false),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) =>
          ResponsiveWrapper.builder(child, breakpoints: [
        const ResponsiveBreakpoint.autoScale(480, name: MOBILE),
        const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
      ]),
    );
  }
}
