import 'package:flutter/material.dart';
import 'package:shorinryu/precentation/view/user/new_applycation/new_admission.dart';

// ignore: must_be_immutable
class CustumTextField extends StatelessWidget {
  CustumTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.labelTxt});

  final String hintText;
  final String labelTxt;
  final TextEditingController controller;

  NewAdmissionScreen addmissionScreen = NewAdmissionScreen();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: addmissionScreen.formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              label: Text(
                labelTxt,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
              fillColor: const Color.fromARGB(255, 232, 230, 230),
              filled: true,
              hintText: hintText,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter$labelTxt';
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }
}
