import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Koperasi Undiksha"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            child: Image.asset(''),
          )
        ],
      ),
    ),
  ));
}
