import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas1/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final bool isObscure = true;
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  var loading = false;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isObscure = true;
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
                          child: Text("email"),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a Email!';
                        }
                        return null;
                      },
                      controller: _emailController,
                      obscureText: isObscure,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text("username"),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a Username';
                        }
                        return null;
                      },
                      controller: _usernameController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'username',
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
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a password!';
                        }
                        return null;
                      },
                      obscureText: isObscure,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isObscure ? Icons.visibility_off : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                        ),
                        hintText: "Password",
                        hintStyle: const TextStyle(color: Colors.grey),
                      ),
                      style: const TextStyle(color: Colors.black),
                      autofocus: false,
                    ),
                    ElevatedButton(
                      onPressed: signIn,
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
                    // Container(
                    //   height: 40,
                    //   width: MediaQuery.of(context).size.width / 3,
                    //   color: Colors.blue,
                    //   child: ElevatedButton(
                    //     onPressed: () async {
                    //       final String username =
                    //           _usernameController.text.trim();
                    //       final String password =
                    //           _passwordController.text.trim();

                    //       if (username.isEmpty) {
                    //         print("Username is Empty");
                    //       } else {
                    //         if (password.isEmpty) {
                    //           print("Password is Empty");
                    //         } else {
                    //           QuerySnapshot snap = await FirebaseFirestore
                    //               .instance
                    //               .collection("users")
                    //               .where("username", isEqualTo: username)
                    //               .get();
                    //           // ignore: use_build_context_synchronously
                    //           context.
                    //           read<AuthService>().login(
                    //                 snap.docs[0]['email'],
                    //                 password,
                    //               );
                    //         }
                    //       }
                    //     },
                    //     child: Text("LOG IN"),
                    //   ),
                    // ),
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
                        width: 70,
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

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print, unused_local_variable
      var title = '';
      switch (e.code) {
        case 'wrong-password':
          title = 'Wrong Password !';
          break;
        case 'user-not-found':
          title = 'Unknow error has occurred';
          break;
        case 'user-disabled':
          title = 'The user you tried to log into is disable';
          break;
        case 'invalid-email':
          title = 'The user you tried to log into was not found';
          break;
      }
    }
  }

  Future _signUp() async {
    // setState(() {
    //   loading = true;
    // });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      await FirebaseFirestore.instance.collection('users').add({
        'email': _emailController.text,
        //   // 'imageurl': imageUrl,
        'username': _usernameController.text,
        'password': _passwordController.text,
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
      // print(e);
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
