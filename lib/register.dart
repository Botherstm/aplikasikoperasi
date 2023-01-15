import "package:flutter/material.dart";
import 'package:project_uas/login.dart';

import 'main.dart';
import 'model/list_users_model.dart';
import 'service/list_users_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController NamaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Koperasi Undiksha'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 10, 7, 139),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Image(
                    image: AssetImage('assets/img/logo.png'),
                    width: 200,
                    height: 200,
                  ),
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 50.0),
                ),
                SizedBox(
                  height: 20.0,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Username'),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                          controller: EmailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          )),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text('Password'),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: PasswordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text('Nama'),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: NamaController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      // Spacer(),
                      SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.height * 0.2,
                          child: ElevatedButton(
                            onPressed: () async {
                              ListUsersService _service = ListUsersService();
                              ListUsersModel user = await _service.postRegister(
                                  EmailController.text,
                                  PasswordController.text,
                                  NamaController.text);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()),
                              );
                            },
                            child: Text('Daftar'),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
                              );
                            },
                            child: Text('Sudah Memiliki Akun Login!'),
                          ),
                          TextButton(
                              onPressed: () {}, child: Text('Lupa Password?'))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: Center(
                      child: Text('Copyright @2023 By James Pieter Loro',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  width: double.infinity,
                  height: 50.0,
                  color: Color.fromARGB(255, 114, 142, 228),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
