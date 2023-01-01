import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:new_year_resolution/pages/home.dart';
import 'package:new_year_resolution/pages/intro.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigatetohome();
  }

  navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 3000), (() {}));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
      return Intro();
    })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Lottie.asset(
        'assets/2023.json',
      ),
    ));
  }
}
