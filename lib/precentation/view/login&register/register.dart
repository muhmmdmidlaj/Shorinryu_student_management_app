import 'package:flutter/material.dart';
import 'package:shorinryu/precentation/view/login&register/login.dart';
import 'package:shorinryu/precentation/view/user/home_user/home.dart';
import 'package:sizer/sizer.dart';
import '../../../api/authenticate/register/register_authenticat.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();

  void submitForm() {
    String username = userNameController.text;
    String email = emailController.text;
    String password = passWordController.text;
    Map<String, dynamic> data = {
      'name': username,
      'email': email,
      'password': password
    };
    registerUser(data);
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        'asset/img/karate-graduation-blackbelt-martial-arts.jpg'))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 60.h,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(184, 0, 0, 0),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            const Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextFormField(
                                  controller: userNameController,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          255, 136, 134, 120),
                                      hintText: 'User Name',
                                      hintStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter User Name';
                                    } else {
                                      return null;
                                    }
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color.fromARGB(
                                        255, 136, 134, 120),
                                    hintText: 'Email',
                                    hintStyle: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Email';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextFormField(
                                  obscureText: true,
                                  controller: passWordController,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          255, 136, 134, 120),
                                      hintText: 'Password',
                                      hintStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter Password';
                                    } else {
                                      return null;
                                    }
                                  }),
                            ),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Already have an account?",
                                    style:
                                        TextStyle(color: Colors.yellowAccent),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginPage(),
                                          ));
                                    },
                                    child: const Text('Login'),
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  submitForm();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePageUser(),
                                      ),
                                      (route) => false);
                                }
                              },
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color.fromARGB(255, 253, 0, 0))),
                              child: const Text('Register'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
