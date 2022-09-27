import 'dart:async';

import 'package:flite/screens/home.dart';
import 'package:flite/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/student_controller.dart';
import 'controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    gotoPage();
  }

  gotoPage() async {
    bool? isRepeat = await getRepeat();
    Future.delayed(Duration(seconds: 2));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (BuildContext context) =>
          isRepeat != null ? const Home() : SiugnUp(),
    ));
  }

  Future<bool?> getRepeat() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    final bool? repeat = _prefs.getBool('repeat');
    return repeat;
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => StudentController(),
    );
    return Scaffold(
        body: Column(children: [
      Expanded(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff1AAC89),
                Color(0xff22EF80),
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                  top: Get.height * 0.64,
                  left: Get.width * 0.3,
                  child: const Text(
                    "SqFlite",
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    ]));
  }
}
