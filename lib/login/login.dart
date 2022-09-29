import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _fromKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  var loading = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                    ElevatedButton(
                      onPressed: _signUp
                      // if (_fromKey.currentState != null &&
                      //     _fromKey.currentState!.validate()) {
                      //   _signUp();
                      // }
                      ,
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
                            'Register',
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
    );
  }

  Future _signUp() async {
    setState(() {
      loading = true;
    });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      await FirebaseFirestore.instance.collection('users').add({
        'email': _emailController,
        // 'imageurl': imageUrl,
        'name': _nameController,
        'password': _passwordController,
      });
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Sign up Succeeded'),
          content: const Text('Your account was create, now you can log in'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      _handleSignUpError(e);
    }
  }

  void _handleSignUpError(FirebaseAuthException e) {
    String messageToDisplay;
    switch (e.code) {
      case 'email-already-in-use':
        messageToDisplay = 'This email already in use';
        break;
      case 'invalid-email':
        messageToDisplay = 'The email you ented is Invalid';
        break;
      case 'operation-not-allowed':
        messageToDisplay = 'This operation not allowed';
        break;
      case 'weak-password':
        messageToDisplay = 'the password is to weak';
        break;
      default:
        messageToDisplay = 'An unknown error occurred';
        break;
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('register failed'),
        content: Text(messageToDisplay),
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
}
