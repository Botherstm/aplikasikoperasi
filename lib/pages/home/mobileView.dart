// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:project_uas/service/service_app.dart';

import '../../model/list_users_model.dart';
import '../../model/tombol.dart';
import '../../model/userpreference.dart';
import '../bank/deposito.dart';
import '../bank/transfer.dart';
import '../bank/penarikan.dart';

// ignore: must_be_immutable
class MobileView extends StatefulWidget {
  MobileView({Key? key, required this.myUser}) : super(key: key);
  ListUsersModel? myUser;
  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  // ignore: non_constant_identifier_names
  double hitungPersentase(double total, double persentase) {
    return total * persentase / 100;
  }

  Service userServices = Service();

  ListUsersModel? user;

  UserReferences pref = UserReferences();

  updateUser() async {
    List<ListUsersModel?> userA =
        await userServices.getUser(user_id: user!.user_id);
    user = userA[0];
    print('updateUser ${user!.saldo}');
  }

  startUser() {
    user = widget.myUser;
    print('startUser ${user!.saldo}');
  }

  @override
  void initState() {
    startUser();
    super.initState();
  }

  bool visibility1 = true; //agar saat setiap page dibuka, dalam kondisi show
  bool visibility2 = false; //agar saat setiap page dibuka, dalam kondisi hide

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == '1') {
        visibility1 = visibility;
      }
      if (field == '2') {
        visibility2 = visibility;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                // height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: const Color.fromARGB(255, 10, 7, 139),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 350,
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color:
                                      const Color.fromARGB(255, 206, 191, 238)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Nasabah',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(user!.nama),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 350,
                                    padding: const EdgeInsets.all(20.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: const Color.fromARGB(
                                            255, 206, 191, 238)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Total Saldo Anda',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                await updateUser();
                                                setState(() {
                                                  user = user;
                                                  user!.saldo = user!.saldo;
                                                });
                                                _changed(true, '1');
                                                _changed(false, '2');
                                              },
                                              child: visibility1
                                                  ? InkWell(
                                                      onTap: () {
                                                        _changed(false,
                                                            '1'); //fungsi changed
                                                        _changed(true, '2');
                                                      },
                                                      child: const Icon(
                                                        Icons.visibility,
                                                        color: Colors.black,
                                                      ),
                                                    )
                                                  : const Icon(
                                                      Icons.visibility_off,
                                                      color: Colors.black,
                                                    ),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Visibility(
                                              visible: visibility2,
                                              child: Text(
                                                'Rp ' + user!.saldo.toString(),
                                                style: const TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Visibility(
                                              visible: visibility1,
                                              child: const Text(
                                                '********',
                                                style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
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
                padding: const EdgeInsets.all(20.0),
                // height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: const Color.fromARGB(255, 10, 7, 139),
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          tombolkategori(
                            Icons.money,
                            'Transfer',
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Transfer(),
                                ),
                              );
                            },
                          ),
                          tombolkategori(
                            Icons.money_sharp,
                            'Deposit',
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Deposito(),
                                ),
                              );
                            },
                          ),
                          tombolkategori(
                            Icons.wallet_membership_outlined,
                            'Penarikan',
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Penarikan(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
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
                              Text(
                                'Butuh Bantuan?',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '0822-1429-8573',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.call,
                            size: 80,
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
