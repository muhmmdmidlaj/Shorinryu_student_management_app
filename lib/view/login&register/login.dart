import 'package:flutter/material.dart';
import 'package:shorinryu/controller/api/authenticate/user_auth.dart';
import 'package:shorinryu/view/admin/home/admin_home.dart';
import 'package:shorinryu/view/login&register/register.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  // UserAuthFunctions logn = UserAuthFunctions();
  void loginSubmitForm(ctx) async {
    String email = loginEmailController.text;
    String password = loginPasswordController.text;
    Map<String, dynamic> data = {'email': email, 'password': password};
    // await logn.loginUser(data);
    loginUser(data, ctx);
  }

  final loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 231, 241, 250),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'asset/img/karate-graduation-blackbelt-martial-arts.jpg'))),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 60.h,
              decoration: const BoxDecoration(
                color: Color.fromARGB(157, 0, 0, 0),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: loginKey,
                  child: Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                            controller: loginEmailController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 136, 134, 120),
                                hintText: 'Email',
                                hintStyle: const TextStyle(
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter Email';
                              } else {
                                return null;
                              }
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          obscureText: true,
                          controller: loginPasswordController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 136, 134, 120),
                              hintText: 'Password',
                              hintStyle: const TextStyle(
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Password';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AdminHomeScreen(),
                                    ));
                              },
                              child: const Text('Forgot Password'),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (loginKey.currentState!.validate()) {
                            loginSubmitForm(context);
                          }
                        },
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 253, 0, 0))),
                        child: const Text('Login'),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: const Text(
                              "Don't have an account?",
                              style: TextStyle(color: Colors.yellowAccent),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterScreen(),
                                    ));
                              },
                              child: const Text('Sign up'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
