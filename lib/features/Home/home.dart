import 'package:contact_app/core/app_colors.dart';
import 'package:contact_app/core/gen/assets.gen.dart';
import 'package:contact_app/features/Home/contact_card.dart';
import 'package:contact_app/features/Home/contact_sheet.dart';
import 'package:contact_app/features/Home/data/models/contact_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  new({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        spacing: 4,
        mainAxisAlignment: .end,
        children: [
          contacts.isEmpty
              ? SizedBox()
              : FloatingActionButton(
                  onPressed: () {
                    contacts.removeAt(contacts.length - 1);
                    setState(() {});
                  },
                  backgroundColor: AppColors.red,
                  child: Assets.icons.delete.svg(),
                ),
          contacts.length == 6
              ? SizedBox()
              : FloatingActionButton(
                  onPressed: () {
                    contactSheet(context, () {
                      setState(() {});
                    });
                  },
                  backgroundColor: AppColors.gold,
                  child: Assets.icons.icon.svg(),
                ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: contacts.isEmpty
              ? Column(
                  children: [
                    Align(
                      alignment: .topLeft,
                      child: Assets.imgs.logo.image(width: 117, height: 40),
                    ),
                    SizedBox(height: 57),
                    Assets.lottie.listPurple.lottie(
                      height: 400,
                      width: 500,
                      repeat: true,
                      alignment: .center,
                      animate: true,
                    ),
                    Text(
                      "There is No Contacts Added Here",
                      style: TextStyle(
                        fontWeight: .w500,
                        fontSize: 20,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                )
              : Column(
                spacing: 10,
                  children: [
                    Align(
                      alignment: .topLeft,
                      child: Assets.imgs.logo.image(width: 117, height: 40),
                    ),
                    
                    Expanded(
                      child: GridView.builder(
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          return ContactCard(
                            cardData: contacts[index],
                            onDelete: () {
                              setState(() {
                                contacts.remove(contacts[index]);
                              });
                            },
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 290,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
