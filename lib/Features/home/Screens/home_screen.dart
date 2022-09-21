import 'package:amasona_clone/Features/home/widget/address_box.dart';
import 'package:amasona_clone/Features/home/widget/app_bar_widget.dart';
import 'package:amasona_clone/Features/home/widget/carousel_image.dart';
import 'package:amasona_clone/Features/home/widget/deal_of_day.dart';
import 'package:amasona_clone/Features/home/widget/top_catagories.dart';
import 'package:amasona_clone/Providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarHomeWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            AddressBox(),
            SizedBox(height: 10),
            Catagories(),
            SizedBox(height: 10),
            CarouselImage(),
            DealOfDayWidget()
          ],
        ),
      ),
    );
  }
}
