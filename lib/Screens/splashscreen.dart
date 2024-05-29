import 'package:coffee_shop/Screens/userauthetication.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/images/Bg_img.jpeg"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topLeft // Cover the entire area
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: 500,
            left: MediaQuery.of(context).size.width / 2 - 170,
            right: MediaQuery.of(context).size.width / 2 - 170,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Better Beans\nBetter Coffee",
                style: GoogleFonts.sourceSans3(
                  fontSize: 55,
                  color: const Color.fromRGBO(135, 92, 53, 1),
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            top: 612,
            left: MediaQuery.of(context).size.width / 2 - 170,
            right: MediaQuery.of(context).size.width / 2 - 170,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "A Hot Cup of Your Morning Happiness",
                style: GoogleFonts.sourceSans3(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
            ),
          Positioned(
            top: 700,
            left: MediaQuery.of(context).size.width / 2 - 149,
            child: Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Loginsignup()),
                  );
                },
                child: Container(
                  height: 78,
                  width: 298,
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
                      "Get Started",
                      style: GoogleFonts.sourceSans3(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ),
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
}