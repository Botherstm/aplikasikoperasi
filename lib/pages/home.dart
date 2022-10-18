import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tugas1dosen/pages/login.dart';

class Home extends StatefulWidget {
  final String username;
  final String password;

  Home({super.key, required this.username, required this.password});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Koperasi Undiksha'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 10, 7, 139),
        leading: ResponsiveVisibility(
          hiddenWhen: [Condition.largerThan(name: TABLET)],
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
        ),
        actions: [
          ResponsiveVisibility(
            visible: false,
            visibleWhen: [Condition.largerThan(name: TABLET)],
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              icon: Icon(Icons.logout),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    ResponsiveRowColumn(
                        rowMainAxisAlignment: MainAxisAlignment.center,
                        layout:
                            ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                                ? ResponsiveRowColumnType.COLUMN
                                : ResponsiveRowColumnType.ROW,
                        children: [
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: Container(
                              padding: EdgeInsets.all(20.0),
                              // height: 100.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Color.fromARGB(255, 10, 7, 139),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Image(
                                      image: AssetImage('assets/img/foto.jpg'),
                                      width: 180,
                                      height: 180,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 150,
                                          padding: EdgeInsets.all(20.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              color: Color.fromARGB(
                                                  255, 206, 191, 238)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Nasabah',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text('${widget.username}'),
                                              Text('${widget.password}'),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 150,
                                                padding: EdgeInsets.all(20.0),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: Color.fromARGB(
                                                        255, 206, 191, 238)),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Total Saldo Anda',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    Text('Rp. 1.000.000'),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ResponsiveRowColumnItem(
                            rowFlex: 2,
                            child: SizedBox(height: 10),
                          ),
                          ResponsiveRowColumnItem(
                            rowFlex: 3,
                            child: Container(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        tombolkategori(
                                            Icons.wallet, 'Cek Saldo'),
                                        tombolkategori(Icons.money, 'Transfer'),
                                        tombolkategori(
                                            Icons.money_sharp, 'Deposito'),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        ResponsiveRowColumnItem(
                                          rowFlex: 4,
                                          child: tombolkategori(
                                              Icons.payment, 'Pembayaran'),
                                        ),
                                        ResponsiveRowColumnItem(
                                          rowFlex: 5,
                                          child: tombolkategori(
                                              Icons.wallet_membership_outlined,
                                              'Pinjaman'),
                                        ),
                                        ResponsiveRowColumnItem(
                                          rowFlex: 6,
                                          child: tombolkategori(
                                              Icons.wallet_sharp, 'Mutasi'),
                                        ),
                                      ],
                                    ),
                                  ]),

                              padding: EdgeInsets.all(20.0),
                              // height: 100.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Color.fromARGB(255, 10, 7, 139),
                                ),
                              ),
                            ),
                          ),
                        ]),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color.fromARGB(255, 206, 191, 238)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Butuh Bantuan?',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                        '082142098573',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Icon(
                                    Icons.call,
                                    size: 80,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue[700],
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            label: "Setting",
            icon: Icon(Icons.settings),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF1C2474),
        onPressed: () {},
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Icon(Icons.qr_code_scanner),
        ),
        elevation: 4.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// ignore: must_be_immutable
class tombolkategori extends StatelessWidget {
  var jenis_icon;
  final String title;
  tombolkategori(
    this.jenis_icon,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 10,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                jenis_icon,
                size: 40,
                color: Colors.blue,
              ),
              Text(title)
            ],
          ),
        ),
      ),
    );
  }
}
