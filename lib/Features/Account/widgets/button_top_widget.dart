import 'package:amasona_clone/Features/Account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class ButtonTopWidget extends StatelessWidget {
  const ButtonTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> _button = [
      'Your Order',
      'Trun Seller',
      'Log Out',
      'Your Wish List'
    ];
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: "Your Order",
              onTap: () {},
            ),
            AccountButton(
              text: "Trun Selle",
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButton(
              text: "Log Out",
              onTap: () {},
            ),
            AccountButton(
              text: "Your Wish List",
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
