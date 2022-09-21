import 'package:amasona_clone/Common/Widgets/buttom_bar.dart';
import 'package:amasona_clone/Features/Admin/Screens/add_product_screen.dart';
import 'package:amasona_clone/Features/Auth/Screens/auth_screen.dart';
import 'package:amasona_clone/Features/home/Screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings route) {
  switch (route.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: route, builder: (context) => const AuthScreen());
    case '/home':
      return MaterialPageRoute(
          settings: route, builder: (_) => const HomeScreen());
    case '/actual-home':
      return MaterialPageRoute(
          settings: route, builder: (_) => const BottomBar());
    case '/add-product':
      return MaterialPageRoute(
          settings: route, builder: (_) => const AddProductScreen());
    default:
      return MaterialPageRoute(
          settings: route,
          builder: (context) => const Scaffold(
                body: Center(
                  child: Text("Screen dose not exit"),
                ),
              ));
  }
}
