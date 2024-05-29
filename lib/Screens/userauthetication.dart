// ignore_for_file: use_build_context_synchronously

import 'package:coffee_shop/Screens/signinscreen.dart';
import 'package:coffee_shop/Screens/signup.dart';
import 'package:coffee_shop/Screens/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginsignup extends StatefulWidget {
  const Loginsignup({super.key});

  @override
  State<Loginsignup> createState() => _LoginsignupState();
}

class _LoginsignupState extends State<Loginsignup> with SingleTickerProviderStateMixin{
  late final TabController _tabController = TabController(length: 2, vsync: this);

  @override
  void initState() {
    super.initState();
    _tabController.addListener(() {
      setState(() {
        _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFFEF4EB),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFEF4EB),
          automaticallyImplyLeading: false,
          title: Text(
            _tabController.index == 0 ? 'Let\'s Get You Signed In' : 'Let\'s Get You Registered',
            style: GoogleFonts.sourceSans3(
              fontSize: 31,
              fontWeight: FontWeight.w600,
            ),
          ),
          toolbarHeight: 80,
          centerTitle: true,
          bottom: PreferredSize(
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
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: const BoxDecoration(
                    color: Color.fromRGBO(214, 151, 93, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black54,
                  tabs: [
                    TabItem(
                      pagetitle: 'SignIn',
                      style: GoogleFonts.sourceSans3(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const TabItem(
                      pagetitle: 'Register',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                  onTap: (index) {
                    setState(() {
                      _tabController.index = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            controller: _tabController,
            children: [
              const SignInScreen(),
              SignUpScreen(
                tabController: _tabController,
                initialTabIndex: _tabController.index,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
