import 'package:flutter/material.dart';
import 'package:push_notification/push_notification.dart';

import '../../model/list_users_model.dart';

import '../../model/userpreference.dart';
import '../../service/service_app.dart';
import '../home/wrapper.dart';

class Deposito extends StatefulWidget {
  const Deposito({
    Key? key,
  }) : super(key: key);

  @override
  State<Deposito> createState() => _DepositoState();
}

class _DepositoState extends State<Deposito> {
  UserReferences pref = UserReferences();

  Service userServices = Service();

  List<ListUsersModel?> user = [];

  String? userId;

  ListUsersModel? myUser;

  late Notificator notification;

  String notificationKey = 'key';
  String _bodyText = 'notification test';
  final _nominalController = TextEditingController();

  void getUser() async {
    userId = await pref.getUserId();
    user = await userServices.getUser(user_id: userId!);
    setState(() {
      myUser = user[0];
    });
  }

  void storeSaldo(nominal) async {
    userId = await pref.getUserId();
    await userServices
        .setoran(nominal: nominal, user_id: userId!)
        .then((value) {
      // snackbar

      notification.show(
        1,
        'Transaksi Berhasil',
        'Setoran sebesar $nominal berhasil',
        imageUrl: 'https://www.lumico.io/wp-019/09/flutter.jpg',
        data: {notificationKey: '[notification data]'},
        notificationSpecifics: NotificationSpecifics(
          AndroidNotificationSpecifics(
            autoCancelable: true,
          ),
        ),
      );
    }).onError((error, stackTrace) {});
// ignore: use_build_context_synchronously

    user = await userServices.getUser(user_id: userId!);
    setState(() {
      myUser = user[0];
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
    notification = Notificator(
      onPermissionDecline: () {
        // ignore: avoid_print
        print('permission decline');
      },
      onNotificationTapCallback: (notificationData) {
        setState(
          () {
            _bodyText = 'notification open: '
                '${notificationData[notificationKey].toString()}';
          },
        );
      },
    )..requestPermissions(
        requestSoundPermission: true,
        requestAlertPermission: true,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deposto'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20.0,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Masukan Jumlah Deposit !'),
                      const SizedBox(
                        height: 10.0,
                      ),

                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: _nominalController,
                        // onChanged: (value) {
                        //   jumlah_setoran = value;
                        // },
                        // controller: jumlah_transfer,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                      // Spacer(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.height * 0.2,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_nominalController.text.isNotEmpty) {
                                storeSaldo(_nominalController.text);
                                _nominalController.clear();
                              }
                            },
                            child: const Text('Setor'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  color: const Color.fromARGB(255, 114, 142, 228),
                  child: const Center(
                      child: Text('Copyright @2023 By James Loro',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
