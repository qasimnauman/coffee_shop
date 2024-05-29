import 'package:coffee_shop/UI_Elements/profilelist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFEF4EB),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      margin: const EdgeInsets.only(
                        top: 100,
                        bottom: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(3, 3),
                            blurRadius: 10,
                          ),
                        ],
                        image: const DecorationImage(
                          image: AssetImage(
                            "lib/assets/images/img.jpg",
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Qasim",
                      style: GoogleFonts.sourceSans3(
                        color: Colors.black87,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                    Text(
                      "DevOps Engineer",
                      style: GoogleFonts.sourceSans3(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 24,
                    right: 24,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(2, 2),
                        blurRadius: 10,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "PROFILE",
                        style: GoogleFonts.sourceSans3(
                          color: Colors.black87,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                      const SizedBox(height: 16,),
                      const ProfileList(icon: Icons.person, text1: "Full Name", text2: "Qasim Nauman",),
                      const ProfileList(icon: Icons.email_outlined, text1: "Email", text2: "m.qasimnauamn@gmail.com",),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}