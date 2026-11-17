import 'package:contact_app/core/app_colors.dart';

import 'package:flutter/material.dart';

class CoustmeTextfield extends StatelessWidget {
  new({
    super.key,
    required this.text,
    required this.controller,
    required this.onChanged,
  });

  String text;

  Function(String? value) onChanged;

  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,

      height: 60,

      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty || value == null) {
            return "requird";
          }
        },

        onChanged: onChanged,

        controller: controller,

        style: TextStyle(color: AppColors.white),

        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),

            borderSide: BorderSide(color: AppColors.white),
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),

            borderSide: BorderSide(color: AppColors.white),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),

            borderSide: BorderSide(color: AppColors.white),
          ),

          hintText: text,

          hintStyle: TextStyle(
            fontSize: 16,

            fontWeight: .w400,

            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
