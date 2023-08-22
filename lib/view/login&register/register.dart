import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shorinryu/controller/api/authenticate/user_auth.dart';
import 'package:shorinryu/controller/provider/register/register_provider.dart';
import 'package:shorinryu/view/login&register/login.dart';
import 'package:shorinryu/view/user/home_user/home.dart';
import 'package:sizer/sizer.dart';
// import '../../../api/authenticate/register/register_authenticat.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Consumer<RegisterProvider>(
          builder: (context, rgProModel, child) => Scaffold(
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
                          key: rgProModel.formKey,
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
                                    controller: rgProModel.userNameController,
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
                                  controller: rgProModel.emailController,
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
                                    controller: rgProModel.passWordController,
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
                                onPressed: () async {
                                  final SharedPreferences prefs =
                                      await SharedPreferences.getInstance();

                                  if (rgProModel.formKey.currentState!
                                      .validate()) {
                                    // ignore: use_build_context_synchronously
                                    await rgProModel.submitForm(context);
                                    const Duration(seconds: 3);

                                    if (prefs.getBool('isRegistered') == true) {
                                      // ignore: use_build_context_synchronously
                                      await Navigator.pushAndRemoveUntil(
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
                                          content: Text('Registration success'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                    } else {
                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Registration failed'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 253, 0, 0)),
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Visibility(
                                      visible: !rgProModel.isLoading,
                                      child: const Text('Register'),
                                    ),
                                    Visibility(
                                      visible: rgProModel.isLoading,
                                      child: const CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(Colors
                                                .white), // Customize color if needed
                                        strokeWidth:
                                            1, // Adjust the thickness of the circle
                                        // Set semantics label for accessibility
                                        semanticsLabel: 'Loading...',
                                      ), // Replace with your loading widget
                                    ),
                                  ],
                                ),
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
          ),
        );
      },
    );
  }

  // void checkUser(String email, context) async {
  //   bool isUserRegistered = await checkUserExists(email);
  //   if (isUserRegistered) {
  //     print('user Exist');
  //     showDialog(
  //       context: context,
  //       builder: (context) => Text('User Already Exist'),
  //     );
  //     // User is already registered
  //   } else {
  //     // User is not registered
  //   }
  // }
}
