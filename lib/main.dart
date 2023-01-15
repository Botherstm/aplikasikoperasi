import 'package:flutter/material.dart';
import 'login.dart';
import 'dashboard.dart';
import 'tombol.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MaterialApp(home: myApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) =>
          ResponsiveWrapper.builder(child, breakpoints: [
        ResponsiveBreakpoint.autoScale(480, name: MOBILE),
        ResponsiveBreakpoint.resize(1000, name: DESKTOP),
      ]),
    );
  }
}
