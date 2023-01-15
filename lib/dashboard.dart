import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:vector_math/vector_math_operations.dart';

import 'mobileView.dart';
import 'model/list_users_model.dart';
import 'scanner.dart';
import 'tabletView.dart';

class Dashboard extends StatefulWidget {
  final ListUsersModel user;
  const Dashboard({Key? key, required this.user}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Koperasi Undiksha'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 10, 7, 139),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 480) {
          return const TabletView();
        } else {
          return MobileView(user: widget.user);
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue[700],
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        items: [
          const BottomNavigationBarItem(
            label: "Setting",
            icon: Icon(Icons.settings),
          ),
          const BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF1C2474),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => QrScanner()),
          );
        },
        child: Container(
          margin: const EdgeInsets.all(15.0),
          child: const Icon(Icons.qr_code_scanner),
        ),
        elevation: 4.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
