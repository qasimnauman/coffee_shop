import 'package:coffee_shop/UI_Elements/dataitem.dart';
import 'package:coffee_shop/UI_Elements/favcard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  final List<DataItemDetail> favItemslist = [
  DataItemDetail(
    title: 'Latte',
    color: Colors.brown[200]!,
    image: 'lib/assets/images/Lattee.jpg',
    description:
        'A latte is a coffee drink made with espresso and steamed milk. The word "latte" is derived from the Italian caffè e latte, which means "coffee and milk".',
    price: '6.5',
  ),
  DataItemDetail(
    title: 'Iced Latte',
    color: Colors.blue[100]!,
    image: 'lib/assets/images/Iced_Latte.jpg',
    description:
        'An iced latte is a cold coffee drink made with espresso and milk. The difference from a regular latte is that it is served over ice.',
    price: '7.2',
  ),
];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        elevation: 0,
        toolbarHeight: 90,
        centerTitle: true,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        title: Text(
          'Favourites',
          style: GoogleFonts.sourceSans3(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${favItemslist.length} items',
                    style: GoogleFonts.sourceSans3(
                      fontSize: 15,
                      color: const Color(0xFFD6975D),
                      decoration: TextDecoration.underline,
                      decorationColor: const Color(0xFFD6975D),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: favItemslist.length,
                  itemBuilder: (BuildContext context, index) {
                    return FavouriteCard(
                      favItemslist: favItemslist[index],
                      index: index,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}