import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tugas1/home.dart';

import 'login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initizilitation = Firebase.initializeApp(
    name: 'aplikasi-koperasi',
    options: const FirebaseOptions(
        apiKey: "AIzaSyDw4VnlvNYVsc1jB_PJcj6zxWjwRtOjHGw",
        authDomain: "aplikasi-koperasi-eeb64.firebaseapp.com",
        projectId: "aplikasi-koperasi-eeb64",
        storageBucket: "aplikasi-koperasi-eeb64.appspot.com",
        messagingSenderId: "876743140978",
        appId: "1:876743140978:web:840f23ceda85345eb344eb"),
  );
  runApp(
    FutureBuilder(
      future: initizilitation,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Home();
        }
        return const Login();
      },
    ),
  );
}
