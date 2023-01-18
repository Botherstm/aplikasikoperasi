import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:project_uas/model/list_users_model.dart';
import 'package:project_uas/pages/home/mobileView.dart';
import 'package:project_uas/pages/home/tabletView.dart';
import 'package:project_uas/pages/login/login.dart';
import 'package:project_uas/service/service_app.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../model/userpreference.dart';
import '../scanner.dart';

// import 'package:shared_preferences/shared_preferences.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  UserReferences userReferences = UserReferences();
  Service userServices = Service();

  String? user_id;

  List<ListUsersModel?> _mod = [null];

  void awaiting() async {
    await userReferences.getUserId().then((value) {
      setState(() {
        user_id = value;
      });
    });
  }

  void datas(user_id) async {
    if (_mod[0] == null) {
      _mod = await userServices.getUser(user_id: user_id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    // cek jika terdapat data login
    userReferences.getUserId().then((value) {
      setState(() {
        user_id = value;
      });
    });

    if (user_id != null && user_id != '') {
      return FutureBuilder(
        builder: ((context, snapshot) {
          datas(user_id);

          if (_mod[0] != null) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: const Text('Koperasi Undiksha'),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 10, 7, 139),
                actions: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        user_id = null;
                        _mod = [null];
                        userReferences.setNullAllData();
                      });
                    },
                    icon: const Icon(Icons.logout),
                  ),
                ],
              ),
              body: LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth > 480) {
                  return const TabletView();
                } else {
                  return MobileView(myUser: _mod[0]);
                }
              }),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.blue[700],
                selectedFontSize: 13,
                unselectedFontSize: 13,
                iconSize: 30,
                // ignore: prefer_const_literals_to_create_immutables
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
                    MaterialPageRoute(
                      builder: (context) => const QrScanner(),
                    ),
                  );
                },
                elevation: 4.0,
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  child: const Icon(Icons.qr_code_scanner),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      );
    } else {
      return const Login();
    }
  }
}
