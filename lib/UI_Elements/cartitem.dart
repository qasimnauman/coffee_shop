import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:coffee_shop/Services/cartservice.dart'; // Replace with your cart service
import 'package:coffee_shop/UI_Elements/dataitem.dart'; // Replace with your data item model
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItem extends StatefulWidget {
  final int index;
  final DataItemDetail item;
  final Function(DataItemDetail) onRemoveItem; // Callback for removal

  const CartItem({super.key, required this.index, required this.item, required this.onRemoveItem});

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool _isFilled = false;
  int noOfCups = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color(0xFFEAEAEA),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.item.image), // Replace with your image property
                  ),
                ),
                width: 100,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.title, // Replace with your title property
                      style: GoogleFonts.sourceSans3(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      '\$${widget.item.price}', // Replace with your price property
                      style: GoogleFonts.sourceSans3(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 5,
          top: 5,
          right: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    noOfCups++;
                  });
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 176, 124, 76),
                  ),
                  child: const Icon(
                    BootstrapIcons.plus,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 30,
                height: 30,
                child: Center(
                  child: Text(
                    '$noOfCups',
                    style: GoogleFonts.sourceSans3(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (noOfCups > 0) noOfCups--;
                  });
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 176, 124, 76),
                  ),
                  child: const Icon(
                    BootstrapIcons.dash,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          right: 50,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isFilled = !_isFilled;
              });
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(
                _isFilled ? BootstrapIcons.heart_fill : BootstrapIcons.heart,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 80,
          child: GestureDetector(
            onTap: () {
              // Trigger callback for removal
              widget.onRemoveItem(widget.item);

              // Show snackbar (optional)
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Removed from cart'),
                ),
              );
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(
                BootstrapIcons.trash,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
