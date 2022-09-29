import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  late final User user;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late User? user;
  @override
  Widget build(BuildContext context) {
    return const Text('ini home');
  }
}
