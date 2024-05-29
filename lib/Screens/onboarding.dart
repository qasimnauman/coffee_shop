import 'package:coffee_shop/UI_Elements/cardcoffee.dart';
import 'package:coffee_shop/UI_Elements/cardcolddrink.dart';
import 'package:coffee_shop/UI_Elements/dataitem.dart';
import 'package:coffee_shop/Screens/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final TextEditingController searchControl = TextEditingController();

  final List<TabItem> tabItems = [
    TabItem(
      pagetitle: 'Coffee',
      style: GoogleFonts.sourceSans3(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    TabItem(
      pagetitle: 'Cold Drinks',
      style: GoogleFonts.sourceSans3(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
  ];

  final List<DataItemDetail> coffeeItemsDetails = [
  DataItemDetail(
    title: 'Espresso',
    color: Colors.brown[100]!,
    image: 'lib/assets/images/espresso.jpg',
    description:
        'Espresso is a coffee-brewing method in which a small amount of nearly boiling water is forced under pressure through finely ground coffee beans. Originating from Italy, the French also made significant contributions via the invention of coffee makers, predecessors of today\'s espresso machines.',
    price: '5.2',
  ),
  DataItemDetail(
    title: 'Latte',
    color: Colors.brown[200]!,
    image: 'lib/assets/images/Lattee.jpg',
    description:
        'A latte is a coffee drink made with espresso and steamed milk. The word "latte" is derived from the Italian caffè e latte, which means "coffee and milk".',
    price: '6.5',
  ),
  DataItemDetail(
    title: 'Cappuccino',
    color: Colors.brown[300]!,
    image: 'lib/assets/images/capuchino.jpg',
    description:
        'Cappuccino is a coffee-based drink made primarily from espresso and milk. A cappuccino consists of a single espresso shot topped with equal parts steamed and frothed milk.',
    price: '7.0',
  ),
  DataItemDetail(
    title: 'Americano',
    color: Colors.brown[400]!,
    image: 'lib/assets/images/americano.jpg',
    description:
        'An Americano is a type of coffee drink prepared by diluting an espresso with hot water, giving it a similar strength to, but different flavor from, traditionally brewed coffee.',
    price: '5.0',
  ),
];

final List<DataItemDetail> coldDrinksDetails = [
  DataItemDetail(
    title: 'Iced Latte',
    color: Colors.blue[100]!,
    image: 'lib/assets/images/Iced_Latte.jpg',
    description:
        'An iced latte is a cold coffee drink made with espresso and milk. The difference from a regular latte is that it is served over ice.',
    price: '7.2',
  ),
  DataItemDetail(
    title: 'Iced Coffee',
    color: Colors.blue[200]!,
    image: 'lib/assets/images/iced_cofeee.png',
    description:
        'Iced coffee is a type of coffee beverage served cold, brewed variously with the fundamental division being cold brewed coffee and iced espresso-based coffee.',
    price: '6.5',
  ),
  DataItemDetail(
    title: 'Cold Brew',
    color: Colors.blue[300]!,
    image: 'lib/assets/images/cold_brew_image.jpg',
    description:
        'Cold brew coffee is made by steeping coarse-ground coffee beans in room temperature water for an extended period, typically 12 hours or more. The result is a smooth, less acidic coffee.',
    price: '7.0',
  ),
  DataItemDetail(
    title: 'Iced Mocha',
    color: Colors.blue[400]!,
    image: 'lib/assets/images/iced_mocha_image.jpg',
    description:
        'An iced mocha is a cold coffee drink made with espresso, cold milk, and chocolate syrup, served over ice and often topped with whipped cream.',
    price: '5.0',
  ),
];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 90,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: const Color(0xFFD6975D),
                child: ClipOval(
                  child: Image.asset(
                    "lib/assets/images/Lattee.jpg",
                    fit: BoxFit.contain,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              Row(
                children: [
                  const Icon(
                    BootstrapIcons.geo_alt,
                    size: 15,
                  ),
                  Text(
                    'Islamabad, Pakistan',
                    style: GoogleFonts.sourceSans3(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  BootstrapIcons.bell,
                  color: Color(0xFFD6975D),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Good Morning, Qasim',
                  style: GoogleFonts.sourceSans3(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Email';
                      }
                      return null;
                    },
                    enableSuggestions: true,
                    style: GoogleFonts.sourceSans3(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    controller: searchControl,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          BootstrapIcons.funnel_fill,
                          color: Colors.black,
                        ),
                      ),
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          BootstrapIcons.search,
                          color: Colors.black,
                        ),
                      ),
                      hintText: 'Search',
                      hintStyle: GoogleFonts.sourceSans3(
                        fontSize: 14,
                        color: const Color.fromRGBO(0, 0, 0, 0.25),
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(237, 236, 236, 1),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Categories',
                    style: GoogleFonts.sourceSans3(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DefaultTabController(
                length: 2,
                child: Expanded(
                  child: Column(
                    children: [
                      PreferredSize(
                        preferredSize: const Size.fromHeight(50),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Color.fromRGBO(245, 245, 245, 1),
                            ),
                            child: TabBar(
                              indicatorSize: TabBarIndicatorSize.tab,
                              dividerColor: Colors.transparent,
                              indicator: const BoxDecoration(
                                color: Color.fromRGBO(214, 151, 93, 1),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black54,
                              tabs: [
                                Tab(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      const Icon(
                                        BootstrapIcons.cup_hot,
                                        size: 20,
                                      ),
                                      Text(
                                        'Coffee',
                                        style: GoogleFonts.sourceSans3(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),                                
                                ),
                                Tab(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      const Icon(
                                        BootstrapIcons.cup_straw,
                                      ),
                                      Text(
                                        'Cold Drinks',
                                        style: GoogleFonts.sourceSans3(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),                                
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: TabBarView(
                          children: [
                            CardCoffee(),
                            CardColdDrink(),
                          ],
                        ),
                      ),
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
