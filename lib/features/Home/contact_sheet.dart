import 'dart:io';

import 'package:contact_app/core/app_colors.dart';
import 'package:contact_app/core/gen/assets.gen.dart';
import 'package:contact_app/features/Home/components/buttons/coustme_buttons.dart';
import 'package:contact_app/features/Home/components/buttons/coustme_textfield.dart';
import 'package:contact_app/features/Home/data/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void contactSheet(BuildContext context, Function onAdd) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.darkBlue,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const ContactSheet(),
      );
    },
  ).then((value) {
    onAdd();
  });
}

class ContactSheet extends StatefulWidget {
  const ContactSheet({super.key});

  @override
  State<ContactSheet> createState() => _ContactSheetState();
}

class _ContactSheetState extends State<ContactSheet> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  File? _selectedImge;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          spacing: 16,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: () {
                        _pickImgeFromGallery();
                      },
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.white),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: _selectedImge != null
                              ? Image.file(_selectedImge!, fit: BoxFit.cover)
                              : Assets.lottie.imagePicker.lottie(),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nameController.text.isEmpty
                            ? "User Name"
                            : nameController.text,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                      const Divider(),
                      Text(
                        emailController.text.isEmpty
                            ? "example@email.com"
                            : emailController.text,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                      const Divider(),
                      Text(
                        phoneController.text.isEmpty
                            ? "+200000000000"
                            : phoneController.text,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Form(
              key: formKey,
              child: Column(
                spacing: 8,

                children: [
                  CoustmeTextfield(
                    text: "Enter User Name ",

                    controller: nameController,

                    onChanged: (value) {
                      setState(() {});
                    },
                  ),

                  CoustmeTextfield(
                    text: "Enter User Email  ",

                    controller: emailController,

                    onChanged: (value) {
                      setState(() {});
                    },
                  ),

                  CoustmeTextfield(
                    text: "Enter User Phone ",

                    controller: phoneController,

                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            CoustmeButtons(
              text: "Enter user",
              onTap: () {
                if (formKey.currentState!.validate() && _selectedImge != null) {
                  Navigator.pop(context);
                  contacts.add(
                    ContactModel(
                      name: nameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                      img: _selectedImge!,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future _pickImgeFromGallery() async {
    final returnedImge = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (returnedImge == null) return;
    setState(() {
      _selectedImge = File(returnedImge.path);
    });
  }
}
