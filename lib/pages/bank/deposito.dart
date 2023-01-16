import 'package:flutter/material.dart';

import '../../model/list_users_model.dart';
import '../../service/nasabah.dart';
import '../home/dashboard.dart';

class Deposito extends StatelessWidget {
  final ListUsersModel user;
  const Deposito({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String jumlah_setoran = '';
    return Scaffold(
      appBar: AppBar(
        title: Text('Pinjaman'),
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
                      const Text('masukan nomor Rekening Tujuan !'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      // TextFormField(
                      //   onChanged: (value) {
                      //     nomor_rekening = value;
                      //   },
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return 'masukan nomor tujuan!';
                      //     }
                      //     return null;
                      //   },
                      //   decoration: const InputDecoration(
                      //     border: UnderlineInputBorder(),
                      //     enabledBorder: UnderlineInputBorder(),
                      //     hintText: "Nomor rekening Tujuan...",
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 20.0,
                      // ),
                      // Text(user.user_id.toString()),
                      const Text('Masukan Jumlah Transfer'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        // controller: jumlah_transfer,
                        onChanged: (value) {
                          jumlah_setoran = value;
                        },
                        // controller: jumlah_transfer,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tolong Masukan Jumlah Transfer!';
                          }
                          return null;
                        },
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
                              String popup = "Transfer Berhasil";
                              NasabahService service = NasabahService();
                              await service.setoran(
                                int.parse(
                                  user.user_id.toString(),
                                ),
                                int.parse(
                                  jumlah_setoran.toString(),
                                ),
                              );
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Dashboard(user: user)),
                              );
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('login berhasil'),
                                  content: Text(popup),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('ok'),
                                    )
                                  ],
                                ),
                              );
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
                  child: const Center(
                      child: Text('Copyright @2023 By James Loro',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  width: double.infinity,
                  height: 50.0,
                  color: const Color.fromARGB(255, 114, 142, 228),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
