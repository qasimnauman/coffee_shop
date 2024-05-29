import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:coffee_shop/Models/coffeemodel.dart';
import 'package:coffee_shop/Services/database_service.dart';
import 'package:coffee_shop/UI_Elements/coffeedetailspopup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardColdDrink extends StatefulWidget {
  const CardColdDrink({super.key});

  @override
  State<CardColdDrink> createState() => _CardColdDrinkState();
}

class _CardColdDrinkState extends State<CardColdDrink> {
  final ColdDrinkDBService _databaseService = ColdDrinkDBService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _databaseService.getColdDrink(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading coffee items'));
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No Coffee Items'));
        } else {
          List colddrinks = snapshot.data!.docs;

          return GridView.builder(
            shrinkWrap: false,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 230,
              childAspectRatio: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: colddrinks.length,
            itemBuilder: (context, index) {
              CoffeeModel colddrink = colddrinks[index].data();
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Color(0xFFEAEAEA), width: 1),
                  ),
                  elevation: 5,
                  color: const Color(0xFFF5F5F5),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return Align(
                                alignment: Alignment.topCenter,
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return DetailsPopup(item: colddrink);
                                      },
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    height: 90,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                        image: NetworkImage(colddrink.image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      colddrink.name,
                                      style: GoogleFonts.sourceSans3(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(right: 2),
                                          child: Icon(
                                            BootstrapIcons.star_fill,
                                            size: 15,
                                            color: Colors.orange,
                                          ),
                                        ),
                                        Text(
                                          '4.5',
                                          style: GoogleFonts.sourceSans3(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '\$${colddrink.price}',
                                          style: GoogleFonts.sourceSans3(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.only(right: 10, bottom: 10),
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: const Color(0xFFD6975D),
                                            ),
                                            child: const Icon(
                                              BootstrapIcons.plus_lg,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
