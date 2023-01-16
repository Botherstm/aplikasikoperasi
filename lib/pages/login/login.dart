import 'dart:ui';

import 'package:flutter/material.dart';

import '../home/dashboard.dart';
import '../../model/list_users_model.dart';
import 'register.dart';
import '../../service/list_users_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // ignore: non_constant_identifier_names
  String Username = "";
  // ignore: non_constant_identifier_names
  String Password = "";
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Koperasi Undiksha'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 10, 7, 139),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.only(top: 50.0),
                  child: const Image(
                    image: AssetImage('assets/img/logo.png'),
                    width: 200,
                    height: 200,
                  ),
                ),
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
                      const Text('Username'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a Usename!';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          Username = value;
                        },
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(),
                          hintText: "Username",
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text('Password'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password!';
                          }
                          return null;
                        },
                        obscureText: _isObscure,
                        onChanged: (value) {
                          Password = value;
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                          border: const UnderlineInputBorder(),
                          enabledBorder: const UnderlineInputBorder(
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
                        child: Container(
                          width: MediaQuery.of(context).size.height * 0.2,
                          child: ElevatedButton(
                            onPressed: () async {
                              String popup =
                                  "Selamat Datang di aplikasi M-banking Undiksha!!";
                              ListUsersService service = ListUsersService();
                              ListUsersModel user =
                                  await service.postLogin(Username, Password);
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
                            child: const Text('Login'),
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
                                  builder: (context) => const RegisterPage(),
                                ),
                              );
                            },
                            child: const Text('Daftar M-Banking'),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Lupa Password?'),
                          )
                        ],
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
