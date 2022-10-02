import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  late final User user;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late User? user;
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Koperasi Undiksha'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Column(children: [
                Row(
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset("assets/img/foto.jpg"),
                    ),
                    Column(
                      children: const [
                        Text("Nasabah"),
                        Text("James Pieter Loro"),
                        Text("Total Saldo Anda"),
                        Text("1230124"),
                      ],
                    ),
                  ],
                )
              ]),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: const [
                          Icon(Icons.account_balance_wallet_rounded),
                          Text("Cek Saldo"),
                        ],
                      ),
                      Column(
                        children: const [
                          Icon(Icons.monetization_on_rounded),
                          Text("Transfer"),
                        ],
                      ),
                      Column(
                        children: const [
                          Icon(Icons.account_balance_wallet_rounded),
                          Text("Deposito"),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: const [
                          Icon(Icons.account_balance_wallet_rounded),
                          Text("Cek Saldo"),
                        ],
                      ),
                      Column(
                        children: const [
                          Icon(Icons.monetization_on_rounded),
                          Text("Transfer"),
                        ],
                      ),
                      Column(
                        children: const [
                          Icon(Icons.account_balance_wallet_rounded),
                          Text("Deposito"),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Text("Butuh Bantuan?"),
            const Text("082142098573"),
            const Icon(Icons.phone),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.open_in_new_rounded),
              label: 'Open Dialog',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (int index) {
            switch (index) {
              case 0:
                // only scroll to top when current index is selected.
                if (_selectedIndex == index) {
                  _homeController.animateTo(
                    0.0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                  );
                }
                break;
              case 1:
                showModal(context);
                break;
            }
            setState(
              () {
                _selectedIndex = index;
              },
            );
          },
        ),
      ),
    );
  }

  void showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Example Dialog'),
        actions: <TextButton>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          )
        ],
      ),
    );
  }
}
