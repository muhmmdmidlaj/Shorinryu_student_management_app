import 'package:flutter/material.dart';
import 'package:shorinryu/controller/api/authenticate/user_auth.dart';

class AdminLogoutDilog extends ChangeNotifier{
   void adminShowLogoutConformContent(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              SizedBox(
                height: 150,
                child: Stack(
                  children: [
                    const Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding:  EdgeInsets.only(top: 30),
                          child: Text(
                            'Log out of your account?',
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                        )),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child:const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: () {
                            logOut(context);
                          },
                          child:const Text(
                            'Log Out',
                            style: TextStyle(color: Colors.red),
                          )),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}