import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shorinryu/precentation/view/core/text_field_list.dart';
import 'package:shorinryu/precentation/view/user/new_applycation/widget/custum_textfieald.dart';
import 'package:shorinryu/provider/register_function.dart';
import 'package:sizer/sizer.dart';

class NewAdmissionScreen extends StatelessWidget {
  NewAdmissionScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Consumer<RegisterDetailsForm>(
          builder: (context, admissionModelPro, child) => Scaffold(
              appBar: AppBar(
                centerTitle: true,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.yellowAccent,
                    )),
                backgroundColor: Colors.black.withOpacity(0.7300000190734863),
                title: const Text(
                  'Add Details',
                  style: TextStyle(color: Colors.yellowAccent),
                ),
              ),
              body: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'asset/img/karate-graduation-blackbelt-martial-arts.jpg'),
                        fit: BoxFit.cover),
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.white38, Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      admissionModelPro.fileImage == null
                          ? const CircleAvatar(
                              radius: 80,
                              backgroundImage: AssetImage(
                                  'asset/img/karate-graduation-blackbelt-martial-arts.jpg'),
                            )
                          : CircleAvatar(
                              backgroundImage: FileImage(
                                File(
                                  admissionModelPro.fileImage!.path,
                                ),
                              ),
                              radius: 80,
                            ),
                      ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.grey)),
                        onPressed: () {
                          admissionModelPro.getPhoto();
                        },
                        child: const Text('Select Image'),
                      ),
                      Column(
                        children: List.generate(
                          hintTextList.length,
                          (index) => CustumTextField(
                              hintText: hintTextList[index],
                              rgController: formController[index],
                              labelTxt: labelTextList[index]),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Container(
                          width: double.infinity,
                          height: 55,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 232, 230, 230),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Gender',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20)),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 50),
                                child: Text('Male',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15)),
                              ),
                              Radio(
                                value: false,
                                groupValue: bool,
                                onChanged: (value) {},
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Female',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15)),
                              ),
                              Radio(
                                value: false,
                                groupValue: bool,
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Container(
                          width: double.infinity,
                          height: 55,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 232, 230, 230),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Married',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20)),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 50),
                                child: Text('Yes  ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15)),
                              ),
                              Radio(
                                value: false,
                                groupValue: bool,
                                onChanged: (value) {},
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('    No   ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15)),
                              ),
                              Radio(
                                value: false,
                                groupValue: bool,
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.grey)),
                        onPressed: () {},
                        child: const Text('        Submit        '),
                      ),
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
