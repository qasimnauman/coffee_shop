import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileList extends StatelessWidget {
  final IconData icon;
  final String text1;
  final String text2;

  const ProfileList({
    super.key,
    required this.icon,
    required this.text1,
    required this.text2
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
          ),
          const SizedBox(width: 24,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: GoogleFonts.sourceSans3(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )
              ),
              Text(
                text2,
                style: GoogleFonts.sourceSans3(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}