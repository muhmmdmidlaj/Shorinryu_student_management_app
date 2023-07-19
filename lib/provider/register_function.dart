import 'dart:io';

// import 'package:addstudentpro/DB/model/model.dart';
import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
  import 'package:http/http.dart' as http;

class RegisterDetailsForm extends ChangeNotifier {
  File? image;

  File? fileImage;

  get path => null;
  Future<void> getPhoto() async {
    final photo = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (photo == null) {
      return;
    } else {
      final phototemp = File(photo.path);
      fileImage = phototemp;
      notifyListeners();
    }
   
  }





}
