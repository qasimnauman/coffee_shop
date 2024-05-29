import 'package:coffee_shop/Screens/tab_item.dart';
import 'package:flutter/material.dart';

class TABBAR extends StatelessWidget {
  final List<TabItem> tabItems;

  const TABBAR({super.key, required this.tabItems});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          child: TabBar(
            enableFeedback: true,
            tabAlignment: TabAlignment.fill,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            indicator: const BoxDecoration(
              color: Color.fromRGBO(214, 151, 93, 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: const Color.fromRGBO(0, 0, 0, 0.541),
            tabs: tabItems.map((tabItem) {
              return Tab(
                child: Text(
                  tabItem.pagetitle,
                  style: tabItem.style,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}