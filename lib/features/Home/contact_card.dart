import 'package:contact_app/core/app_colors.dart';
import 'package:contact_app/core/gen/assets.gen.dart';
import 'package:contact_app/features/Home/data/models/contact_model.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  new({super.key, required this.cardData,required this.onDelete});
  ContactModel cardData;
  Function onDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      width: 170,
      height: 280,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: .vertical(top: Radius.circular(16)),
                ),
                width: .infinity,
                height: 150,
                child: Image.file(cardData.img, fit: .cover),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  alignment: .center,
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(cardData.name , textAlign: .center,),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 16,
              children: [
                Row(
                  spacing: 10,
                  children: [Assets.icons.exclude.svg(), Text(cardData.email,style: TextStyle(fontSize: 10),)],
                ),
                Row(
                  spacing: 10,
                  children: [
                    Assets.icons.phoneCall.image(),
                    Text(cardData.phone,style: TextStyle(fontSize: 12),),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    onDelete();
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                    minimumSize: Size(double.infinity, 40),
                    backgroundColor: AppColors.red,
                  ),
                  child: Row(
                    spacing: 3,
                    mainAxisAlignment: .center,
                    children: [
                      Assets.icons.delete.svg(width: 14, height: 14),
                      Text(
                        "Delete",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.white,
                          fontWeight: .w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
