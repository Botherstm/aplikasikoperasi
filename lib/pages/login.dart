import 'package:flutter/material.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String nim = '2015051043';
  String nama = 'james pieter loro';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 19, 1, 99),
        title: const Center(
            child: Text(
          "Koperasi Undiksha",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'HelveticaNeue',
          ),
        )),
      ),
      body: ListView(children: <Widget>[
        SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                    width: 200,
                    child: Image.asset("assets/img/logo.png"),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 247, 247, 247),
                      border: Border.all(color: Colors.black, width: 2.0),
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 5),
                        ),
                        TextFormField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Masukan Username",
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          style: const TextStyle(color: Colors.black),
                          autofocus: false,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 12.0),
                        ),
                        TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Masukan Password",
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          style: const TextStyle(color: Colors.black),
                          obscureText: true,
                          autofocus: false,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 16, bottom: 20),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            String popup1 =
                                "masukan Username & Password yang benar";
                            // ignore: unrelated_type_equality_checks
                            if (_usernameController.text == nama &&
                                // ignore: unrelated_type_equality_checks
                                _passwordController.text == nim) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home(
                                    password: _passwordController.text,
                                    username: _usernameController.text,
                                  ),
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('login gagal'),
                                  content: Text(popup1),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('ok'))
                                  ],
                                ),
                              );
                            }
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: const Text("Daftar Mbanking")),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text("Lupa Passwrod?")),
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
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: const Color.fromARGB(255, 92, 92, 92),
          height: 20.0,
          child: Column(
            children: const [
              Center(
                child: Text("Copyright @2022 by James Pieter Loro"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
