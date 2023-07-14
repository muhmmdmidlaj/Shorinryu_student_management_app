import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        'asset/img/karate-graduation-blackbelt-martial-arts.jpg'))),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      Text('Work '),
                      Text('Hard '),
                      Text('Fight'),
                      Text('Easy'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
