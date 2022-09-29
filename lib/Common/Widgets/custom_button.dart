import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  final bool? isLoading;

  const CustomButton(
      {super.key,
      required this.text,
      required this.ontap,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: isLoading! ? const CircularProgressIndicator() : Text(text),
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
    );
  }
}
