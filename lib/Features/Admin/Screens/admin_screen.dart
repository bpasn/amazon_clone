import 'package:amasona_clone/Features/Admin/Screens/posts_screen.dart';
import 'package:amasona_clone/Features/Admin/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import '../../../Constants/global_variables.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarWidtd = 42;
  double bottomBorderWidtd = 5;
  List<Widget> page = [
    const PostsScreen(),
    const Center(
      child: Text("Analytics Page  !"),
    ),
    const Center(
      child: Text("Cart Page  !"),
    ),
  ];
  
  void updatePage(int page) => setState(() => _page = page);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget(
          addproduct: false,
          text: "Admin",
        ),
      ),
      body: page[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          //POST
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
          //ANALATACS
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
                child: const Icon(Icons.analytics_outlined),
              ),
              label: 'account'),
          //ALL_IN_BOX
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
                  // elevation: 0,
                  // badgeContent: const Text('2'),
                  // badgeColor: Colors.white,
                  child: const Icon(Icons.all_inbox_outlined),
                ),
              ),
              label: 'account'),
        ],
      ),
    );
  }
}
