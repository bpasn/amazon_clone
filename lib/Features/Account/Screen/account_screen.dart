// ignore_for_file: avoid_unnecessary_containers

import 'package:amasona_clone/Constants/global_variables.dart';
import 'package:amasona_clone/Features/Account/widgets/below_widget.dart';
import 'package:amasona_clone/Features/Account/widgets/button_top_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/orders.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(),
      ),
      body: Column(
        children: const [
          BelowAppBarWidget(),
          SizedBox(height: 10),
          ButtonTopWidget(),
          SizedBox(height: 15),
          OrderWidget()
        ],
      ),
    );
  }
}


