import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shorinryu/provider/register_function.dart';
// import 'package:shorinryu/precentation/view/login&register/login.dart';
import 'package:shorinryu/splash_screen/splash.dart';
// import 'package:shorinryu/splash_screen/splash.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegisterDetailsForm()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
