import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:coffee_shop/Models/coffeemodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPopup extends StatefulWidget {
  final CoffeeModel item;

  const DetailsPopup({super.key, required this.item});

  @override
  _DetailsPopupState createState() => _DetailsPopupState();
}

class _DetailsPopupState extends State<DetailsPopup> {
  bool isLiked = false; // State variable to track liked state

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.all(10),
      title: Text(
        widget.item.name,
        style: GoogleFonts.sourceSans3(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200, // Placeholder color
            image: DecorationImage(
              image: NetworkImage(widget.item.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.item.description,
            style: GoogleFonts.sourceSans3(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${widget.item.price.toStringAsFixed(2)}',
                style: GoogleFonts.sourceSans3(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked; // Toggle liked state
                  });
                  // Optional: Add functionality for liking the coffee here
                  print('Coffee ${isLiked ? 'Liked' : 'Unliked'}!');
                },
                icon: Icon(
                  isLiked ? BootstrapIcons.heart_fill : BootstrapIcons.heart,
                  color: Colors.black,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add to cart functionality here
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: const Color(0xFFD6975D),
                  shadowColor: Colors.black,
                  elevation: 5,
                ),
                child: Text(
                  'Add to Cart',
                  style: GoogleFonts.sourceSans3(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
