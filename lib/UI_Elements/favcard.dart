import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:coffee_shop/UI_Elements/dataitem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteCard extends StatefulWidget {
  final DataItemDetail favItemslist;
  final int index;
  const FavouriteCard({super.key, required this.index, required this.favItemslist});

  @override
  State<FavouriteCard> createState() => _FavouriteCardState();
}

class _FavouriteCardState extends State<FavouriteCard> {
  bool _isFilled = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
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
                    image: AssetImage(
                      widget.favItemslist.image,
                    ),
                  )
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
                      widget.favItemslist.title,
                      style: GoogleFonts.sourceSans3(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      '\$${widget.favItemslist.price}',
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
          bottom: 10,
          right: 10,
          child: GestureDetector(
            onTap: () {
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFFD6975D),
              ),
              child: const Icon(
                Icons.add, 
                size: 20,
                color: Colors.white,
              ),
            ),
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
                _isFilled ? BootstrapIcons.heart : BootstrapIcons.heart_fill, 
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    ),
  );  }
}