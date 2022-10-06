import 'package:flutter/material.dart';

import 'pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'aplikasi opesrasi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}

// ignore: must_be_immutable

// ignore: must_be_immutable
// class Checker extends StatelessWidget {
//   var password;

//   var username;
//   Checker({super.key, required this.username, required this.password});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       builder: (context, snapshot) {
//         if (ConnectionState == ConnectionState.done) {
//           return Home(
//             password: null,
//             username: null,
//           );
//         }
//         return const Login();
//       },
//     );
//   }
// }
