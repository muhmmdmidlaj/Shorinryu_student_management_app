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

class RegisterFormController {
  final TextEditingController candidateNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController postOfficeController = TextEditingController();
  final TextEditingController pinNumberController = TextEditingController();
  final TextEditingController proofNumberConroller = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController alternateNumberController =
      TextEditingController();
  final TextEditingController mailIdController = TextEditingController();
  final TextEditingController dOBController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController parentsNameController = TextEditingController();
  final TextEditingController parentsNumberController = TextEditingController();
}

RegisterFormController reclr = RegisterFormController();
final List<TextEditingController> formController = [
  reclr.candidateNameController,
  reclr.addressController,
  reclr.postOfficeController,
  reclr.pinNumberController,
  reclr.proofNumberConroller,
  reclr.contactNumberController,
  reclr.alternateNumberController,
  reclr.mailIdController,
  reclr.dOBController,
  reclr.ageController,
  reclr.parentsNameController,
  reclr.parentsNumberController,
];
