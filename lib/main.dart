// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:project_uas/pages/home/wrapper.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MaterialApp(
        // home: user == null ? Login() : MyApp(),
        home: Wrapper(),
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
