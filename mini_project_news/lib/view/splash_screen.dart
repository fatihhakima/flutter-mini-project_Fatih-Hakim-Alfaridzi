import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_project_news/constant/text_style_constant.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mini_project_news/view/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/splash_screen_so.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(height: 20),
            Text(
              "What'sNEWS",
              style: TextStyleConstant.oswaldBold,
            ),
            const SizedBox(height: 20),
            const SpinKitWave(
              color: Colors.blue,
              size: 40,
            )
          ],
        ),
      ),
    );
  }
}
