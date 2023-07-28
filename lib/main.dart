import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shorinryu/controller/provider/leave_appplication_provider/leave_apply_provi.dart';
import 'package:shorinryu/controller/provider/register_function_prov.dart';
// import 'package:shorinryu/precentation/view/login&register/login.dart';
import 'package:shorinryu/view/splash_screen/splash.dart';
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
        ChangeNotifierProvider(create: (context) => LeaveApplyProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
