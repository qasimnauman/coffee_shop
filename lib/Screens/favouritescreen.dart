import 'dart:async';
import 'package:coffee_shop/Services/database_service.dart';
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
  final DatabaseService coffeedbservice = DatabaseService();
  final StreamController<List<DataItemDetail>> _streamController = StreamController<List<DataItemDetail>>.broadcast();

  @override
  void initState() {
    super.initState();
    coffeedbservice.getlikedColdDrink().listen((favItems) {
      final items = favItems.docs.map((favItem) {
        final data = favItem.data() as Map<String, dynamic>;
        return DataItemDetail(
          title: data['title'],
          image: data['image'],
          description: data['description'],
          price: (data['price'] is double) ? data['price'] : double.parse(data['price'].toString()),
          isfav: data['isfav'],
        );
      }).toList();
      _streamController.add(items);
      print('Fetched items: $items');
    });
  }

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
                padding: const EdgeInsets.only(right: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: StreamBuilder<List<DataItemDetail>>(
                    stream: _streamController.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final favItemslist = snapshot.data!;
                        return Text(
                          '${favItemslist.length} items',
                          style: GoogleFonts.sourceSans3(
                            fontSize: 15,
                            color: const Color(0xFFD6975D),
                            decoration: TextDecoration.underline,
                            decorationColor: const Color(0xFFD6975D),
                          ),
                        );
                      } else {
                        return Text(
                          'Loading...',
                          style: GoogleFonts.sourceSans3(
                            fontSize: 15,
                            color: const Color(0xFFD6975D),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: StreamBuilder<List<DataItemDetail>>(
                  stream: _streamController.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final favItemslist = snapshot.data!;
                      return ListView.builder(
                        itemCount: favItemslist.length,
                        itemBuilder: (BuildContext context, index) {
                          return FavouriteCard(
                            favItemslist: favItemslist[index],
                            index: index,
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(), // Loading indicator
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}
