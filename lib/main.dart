import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shorinryu/controller/provider/admin/admin_dilog_pro.dart';
import 'package:shorinryu/controller/provider/admin/atendance_provider/attandence_prov.dart';
import 'package:shorinryu/controller/provider/admin/leave_rqst_get_provdr/leave_request_get_pro.dart';
import 'package:shorinryu/controller/provider/admin/revenue_prov/revenue_prov.dart';
import 'package:shorinryu/controller/provider/admin/user_get_details/user_details_get_prov.dart';
import 'package:shorinryu/controller/provider/admin/web_socket/web_socket_provider.dart';
import 'package:shorinryu/controller/provider/user/leave_appplication_provider/leave_apply_provi.dart';
import 'package:shorinryu/controller/provider/user/user_profile_update/register_function_prov.dart';
import 'package:shorinryu/controller/provider/websocket_api/websocket_api.dart';
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
        ChangeNotifierProvider(create: (context) => AdminRevenueProvider()),
        ChangeNotifierProvider(create: (context) => UserGetProvider()),
        ChangeNotifierProvider(create: (context) => AdminLogoutDilog()),
        ChangeNotifierProvider(create: (context) => LeaveRequestGetProvider()),
        ChangeNotifierProvider(create: (context) => AttandenceState()),
        ChangeNotifierProvider(create: (context) => WebsocketProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
