// ignore_for_file: use_build_context_synchronously

import 'package:coffee_shop/Screens/forget_password.dart';
import 'package:coffee_shop/Screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController emailControl = TextEditingController();
  late final TextEditingController passwordControl = TextEditingController();
  String email = '', password = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isobscure = true;

  Future<void> userlogin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
      emailControl.clear();
      passwordControl.clear();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'No user found for that email. Creating a new account...',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        );
        try {
          UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          if (userCredential.user != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'User created successfully! Logging in...',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
            emailControl.clear();
            passwordControl.clear();
          }
        } on FirebaseAuthException catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Failed to create a new user: ${e.message}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          );
        }
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Wrong password provided for that user',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Login failed: ${e.message}',
              style: const TextStyle(fontSize: 20),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Email';
                  }
                  return null;
                },
                controller: emailControl,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: GoogleFonts.sourceSans3(
                    fontSize: 14,
                    color: const Color.fromRGBO(0, 0, 0, 0.25),
                    fontWeight: FontWeight.w400,
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(237, 236, 236, 1),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Password';
                  }
                  return null;
                },
                controller: passwordControl,
                obscureText: _isobscure,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: GoogleFonts.sourceSans3(
                    fontSize: 14,
                    color: const Color.fromRGBO(0, 0, 0, 0.25),
                    fontWeight: FontWeight.w400,
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(237, 236, 236, 1),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isobscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        _isobscure = !_isobscure;
                      });
                    },
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PasswordRecovery()),
                );
              },
              child: Container(
                padding: const EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password ?",
                    style: GoogleFonts.sourceSans3(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    email = emailControl.text;
                    password = passwordControl.text;
                  });
                  await userlogin(); // Await here to ensure proper execution
                }
              },
              child: Container(
                height: 78,
                width: MediaQuery.of(context).size.width * 0.9,
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(214, 151, 83, 1),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Sign In",
                    style: GoogleFonts.sourceSans3(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
