import 'package:coffee_shop/Screens/review.dart';
import 'package:coffee_shop/Services/cartservice.dart';
import 'package:coffee_shop/UI_Elements/cartitem.dart';
import 'package:coffee_shop/UI_Elements/dataitem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int noOfCups = 0;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    List<DataItemDetail> cartItems = cartService.cartItems.map((coffee) => DataItemDetail(
      title: coffee.name,
      image: coffee.image,
      description: coffee.description,
      price: coffee.price,
      isfav: false, // assuming all cart items are not marked as favorite
    )).toList();

    double subTotal = cartItems.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
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
          'My Cart',
          style: GoogleFonts.sourceSans3(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      CartItem(index: index, item: cartItems[index]),
                    ],
                  );
                },
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'No of Cups:',
                    style: GoogleFonts.sourceSans3(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${cartItems.length}',
                    style: GoogleFonts.sourceSans3(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sub Total:',
                    style: GoogleFonts.sourceSans3(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '\$$subTotal',
                    style: GoogleFonts.sourceSans3(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReviewScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: const Color(0xFFD6975D),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Proceed to Checkout',
                      style: GoogleFonts.sourceSans3(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
