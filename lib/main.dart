import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tugas1/home.dart';

import 'pages/login.dart';

// void main() {
//   runApp(Home());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDw4VnlvNYVsc1jB_PJcj6zxWjwRtOjHGw",
        authDomain: "aplikasi-koperasi-eeb64.firebaseapp.com",
        projectId: "aplikasi-koperasi-eeb64",
        storageBucket: "aplikasi-koperasi-eeb64.appspot.com",
        messagingSenderId: "876743140978",
        appId: "1:876743140978:web:840f23ceda85345eb344eb"),
  );

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Check(),
      // home: FutureBuilder(
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState != ConnectionState.done) {
      //       return const Home();
      //     }
      //     return const Login();
      //   },
      // ),
    ),
  );
}

class Check extends StatefulWidget {
  const Check({super.key});

  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {
  final _initizilitation = Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDw4VnlvNYVsc1jB_PJcj6zxWjwRtOjHGw",
        authDomain: "aplikasi-koperasi-eeb64.firebaseapp.com",
        projectId: "aplikasi-koperasi-eeb64",
        storageBucket: "aplikasi-koperasi-eeb64.appspot.com",
        messagingSenderId: "876743140978",
        appId: "1:876743140978:web:840f23ceda85345eb344eb"),
  );
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initizilitation,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Home();
        }
        return const Login();
      },
    );
  }
}
