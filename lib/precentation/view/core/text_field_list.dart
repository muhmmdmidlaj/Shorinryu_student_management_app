import 'package:flutter/material.dart';

final List<String> hintTextList = [
  'Full Name',
  'Permenent Address',
  'Post',
  'Pin',
  'Aadhar/PAN Number',
  'Contact Number',
  'Alternate Number',
  'Email ID',
  'dd/mm/yyyy',
  'Age',
  "Father's/Husbands Name",
  "Parant Contact Number"
];
final List<String> labelTextList = [
  'Name',
  'Address',
  'Post',
  'Pin',
  'Aadhar/PAN Number',
  'Contact Number',
  'Altrenate Number',
  'Mail ID',
  'Date Of Birth',
  'Age',
  'Parents Name',
  'Parent Contact Number'
];

final TextEditingController candidateNameController = TextEditingController();
final TextEditingController addressController = TextEditingController();
final TextEditingController postOfficeController = TextEditingController();
final TextEditingController pinNumberController = TextEditingController();
final TextEditingController proofNumberConroller = TextEditingController();
final TextEditingController contactNumberController = TextEditingController();
final TextEditingController alternateNumberController = TextEditingController();
final TextEditingController mailIdController = TextEditingController();
final TextEditingController dOBController = TextEditingController();
final TextEditingController ageController = TextEditingController();
final TextEditingController parentsNameController = TextEditingController();
final TextEditingController parentsNumberController = TextEditingController();

final List<TextEditingController> formController = [
  candidateNameController,
  addressController,
  postOfficeController,
  pinNumberController,
  proofNumberConroller,
  contactNumberController,
  alternateNumberController,
  mailIdController,
  dOBController,
  ageController,
  parentsNameController,
  parentsNumberController,
];
