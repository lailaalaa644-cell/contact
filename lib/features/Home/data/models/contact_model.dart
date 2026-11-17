import 'dart:io';

class ContactModel {
  ContactModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.img,
  });
  File img;
  String name;
  String email;
  String phone;
}

List<ContactModel> contacts = [];
