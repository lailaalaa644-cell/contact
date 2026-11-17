import 'package:flutter/material.dart';

class CoustmeButtons extends StatelessWidget {
  CoustmeButtons({super.key, required this.text, required this.onTap});
  String text;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap!();
      },

      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        minimumSize: Size(double.infinity, 60),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.surface,
          fontWeight: .normal,
        ),
      ),
    );
  }
}
