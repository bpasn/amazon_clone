import 'package:amasona_clone/Constants/global_variables.dart';
import 'package:amasona_clone/Features/Account/Screen/account_screen.dart';
import 'package:amasona_clone/Features/home/Screens/home_screen.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidtd = 42;
  double bottomBorderWidtd = 5;
  List<Widget> page = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(
      child: Text("Cart Page  !"),
    ),
  ];

  void updatePage(int page) => setState(() => _page = page);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          //HOME
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidtd,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _page == 0
                            ? GlobalVariables.selectedNavBarColor
                            : GlobalVariables.backgroundColor,
                        width: bottomBorderWidtd),
                  ),
                ),
                child: const Icon(Icons.home_outlined),
              ),
              label: 'home'),
          //ACCOUNT
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidtd,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _page == 1
                            ? GlobalVariables.selectedNavBarColor
                            : GlobalVariables.backgroundColor,
                        width: bottomBorderWidtd),
                  ),
                ),
                child: const Icon(Icons.person_outline_outlined),
              ),
              label: 'account'),
          //CART SHOPPING
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidtd,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _page == 2
                            ? GlobalVariables.selectedNavBarColor
                            : GlobalVariables.backgroundColor,
                        width: bottomBorderWidtd),
                  ),
                ),
                child: Badge(
                  elevation: 0,
                  badgeContent: const Text('2'),
                  badgeColor: Colors.white,
                  child: const Icon(Icons.shopping_cart_outlined),
                ),
              ),
              label: 'account'),
        ],
      ),
    );
  }
}
