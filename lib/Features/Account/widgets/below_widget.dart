import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Constants/global_variables.dart';
import '../../../Models/user_model.dart';
import '../../../Providers/user_provider.dart';

class BelowAppBarWidget extends StatelessWidget {
  const BelowAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;

    return Container(
      decoration: const BoxDecoration(gradient: GlobalVariables.appBarGradient),
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
                text: 'Hello, ',
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: user.name,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
