import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shorinryu/controller/api/authenticate/user_auth.dart';
import 'package:shorinryu/controller/provider/login&logout/login_provider.dart';
import 'package:shorinryu/view/admin/home/admin_home.dart';
import 'package:shorinryu/view/login&register/register.dart';
import 'package:shorinryu/view/user/home_user/home.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 231, 241, 250),
        body: Consumer<LoginProvier>(
          builder: (context, LoginProModel, child) => Container(
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
                    key: LoginProModel.loginKey,
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
                              controller: LoginProModel.loginEmailController,
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
                            controller: LoginProModel.loginPasswordController,
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
                          onPressed: LoginProModel.isLoading
                              ? null // Disable the button while loading
                              : () async {
                                  final SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  if (LoginProModel.loginKey.currentState!
                                      .validate()) {
                                    // ignore: use_build_context_synchronously
                                    await LoginProModel.loginSubmitForm(
                                        context);
                                    // const Duration(seconds: 3);
                                    // Check login result and show appropriate messages
                                    if (prefs.getBool('isUserLogined') ==
                                        true) {
                                      // ignore: use_build_context_synchronously
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePageUser(),
                                        ),
                                        (route) => false,
                                      );

                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Login Successful'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                    } else if (prefs
                                            .getBool('isSuperUserlogInd') ==
                                        true) {
                                      // ignore: use_build_context_synchronously
                                      await Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const AdminHomeScreen(),
                                        ),
                                        (route) => false,
                                      );

                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Login Successful'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                    } else {
                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Login failed'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }
                                  }
                                },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 253, 0, 0)),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Visibility(
                                visible: !LoginProModel.isLoading,
                                child: const Text('Login'),
                              ),
                              Visibility(
                                visible: LoginProModel.isLoading,
                                child: const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors
                                          .white), // Customize color if needed
                                  strokeWidth:
                                      1, // Adjust the thickness of the circle
                                  // Set semantics label for accessibility
                                  semanticsLabel: 'Loading...',
                                ), // Replace with your loading widget
                              ),
                            ],
                          ),
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
      ),
    );
  }
}
