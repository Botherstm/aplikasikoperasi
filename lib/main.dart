import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Koperasi Undiksha"),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(8, 3, 82, 1),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          SizedBox(
            width: 150,
            height: 150,
            child: Image.asset('assets/img/logo.png'),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2.0, color: const Color.fromARGB(255, 0, 0, 0)),
              ),
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text("Username"),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Text("Password"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          30.0,
                        ),
                      ),
                      primary: const Color.fromRGBO(8, 3, 82, 1),
                    ),
                    child: const SizedBox(
                      width: 50,
                      child: Center(
                        child: Text(
                          'Login',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  ));
}
