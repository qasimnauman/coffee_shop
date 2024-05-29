// ignore_for_file: use_build_context_synchronously
import 'package:coffee_shop/Models/user_model.dart';
import 'package:coffee_shop/Services/userrepo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
   final TabController tabController;
   final int initialTabIndex;

  const SignUpScreen({super.key, required this.tabController, required this.initialTabIndex});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController nameControl = TextEditingController();
  late final TextEditingController emailControl = TextEditingController();
  late final TextEditingController passControl = TextEditingController();
  final userRepo = Get.put(UserRepo());
  String email='',name='',password='';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
  }

  bool _isobscure = true;
  void registeration() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailControl.text,
          password: passControl.text,
        );
        widget.tabController.animateTo(0);
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'User Registered',
              style: GoogleFonts.sourceSans3(
                fontSize: 20,
              ),
            ),
          ),
        );
        emailControl.clear();
        passControl.clear();
        nameControl.clear();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orange,
              content: Text(
                'Provided password is too weak',
                style: GoogleFonts.sourceSans3(
                  fontSize: 20,
                ),
              ),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          );
        }
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
                        validator: (value)
                        {
                          if(value == null || value.isEmpty)
                          {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        controller: nameControl,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          hintStyle: GoogleFonts.sourceSans3(
                            fontSize: 14,
                            color: const Color.fromRGBO(0, 0, 0, 0.25),
                            fontWeight: FontWeight.w400,
                          ),
                          filled: true,
                          fillColor: const Color.fromRGBO(237, 236, 236, 1),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextFormField(
                        validator: (value)
                        {
                          if(value == null || value.isEmpty)
                          {
                            return 'Please enter your email';
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
                            borderSide: BorderSide.none
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextFormField(
                        validator: (value)
                        {
                          if(value == null || value.isEmpty)
                          {
                            return 'Please enter your Password';
                          }
                          return null;
                        },
                        controller: passControl,
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
                            borderSide: BorderSide.none
                          ),
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
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          email=emailControl.text;
                          name=nameControl.text;
                          password=passControl.text;
                        });
                      }
                      registeration();
                      final user = UserModel(
                        id: emailControl.text.trim(),
                        name: nameControl.text.trim(),
                        password: passControl.text.trim(),
                      );
                      createUser(user);        
                    },
                      child: Container(
                        height: 78,
                        width: MediaQuery.of(context).size.width* 0.9,
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
                          ]
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Register Now",
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
