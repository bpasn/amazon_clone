import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const AccountButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0.0),
            color: Colors.white,
            borderRadius: BorderRadius.circular(50)),
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black12.withOpacity(0.03),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.normal, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
