import 'package:flutter/material.dart';
import 'package:new_year_resolution/pages/home.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/todo.jpg')),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                " Write out your new year resolutions📝",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                " Check out when resolution is \naccomplished🎯",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                " Make sure you don't tell anyone \nso it can be achived🤫",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: ((context) {
            return Home();
          })));
        }),
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
