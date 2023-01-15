import 'package:flutter/material.dart';

import 'model/list_users_model.dart';
import 'pages/cek_saldo.dart';
import 'pages/deposito.dart';
import 'pages/mutasi.dart';
import 'pages/pembayaran.dart';
import 'pages/pinjaman.dart';
import 'pages/transfer.dart';
import 'tombol.dart';

class MobileView extends StatelessWidget {
  final ListUsersModel user;
  const MobileView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Image(
                          image: AssetImage('assets/img/foto.jpg'),
                          width: 180,
                          height: 180,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 150,
                              padding: EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color.fromARGB(255, 206, 191, 238)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Nasabah',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(user.nama.toString()),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    // width: 150,
                                    padding: EdgeInsets.all(20.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color:
                                            Color.fromARGB(255, 206, 191, 238)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Total Saldo Anda',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        Text(user.saldo.toString()),
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
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(20.0),
                // height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Color.fromARGB(255, 10, 7, 139),
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          tombolkategori(
                            Icons.wallet,
                            'Cek Saldo',
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CekSaldo()),
                              );
                            },
                          ),
                          tombolkategori(
                            Icons.money,
                            'Transfer',
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Transfer()),
                              );
                            },
                          ),
                          tombolkategori(
                            Icons.money_sharp,
                            'Deposito',
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Deposito()),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          tombolkategori(
                            Icons.payment,
                            'Pembayaran',
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Pembayaran()),
                              );
                            },
                          ),
                          tombolkategori(
                            Icons.wallet_membership_outlined,
                            'Pinjaman',
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Pinjaman()),
                              );
                            },
                          ),
                          tombolkategori(
                            Icons.wallet_sharp,
                            'Mutasi',
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Mutasi()),
                              );
                            },
                          ),
                        ],
                      ),
                    ]),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color.fromARGB(255, 206, 191, 238)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Butuh Bantuan?',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(
                                '0878-1234-1024',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            ],
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
    );
  }
}
