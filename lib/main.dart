import 'package:flutter/material.dart';
import 'login.dart';
import 'dashboard.dart';
import 'tombol.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MaterialApp(home: Login(), debugShowCheckedModeBanner: false));
}

// Future<void> main() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var status = prefs.getBool('isLoggedIn') ?? false;
//   print(status);
//   runApp(MaterialApp(home: status == true ? Login() : Home()));
// }

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
