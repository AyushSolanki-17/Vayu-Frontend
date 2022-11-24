// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import "package:flutter/material.dart";
import 'package:hexcolor/hexcolor.dart';
import 'package:vayu/screens/home_screen/home_screen.dart';
import 'package:vayu/theme/AppTheme.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Screen Size
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppTheme.primaryGreen,
      resizeToAvoidBottomInset: false,
      // ignore: prefer_const_literals_to_create_immutables
      body: SafeArea(
        child: Column(children: [
          // Top Banner
          Stack(children: [
            Image.asset(
              'assets/banner.png',
            ),
            Opacity(
              opacity: 0.8,
              child: Container(
                color: HexColor("#067F7B"),
                height: 260,
              ),
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 0, left: 10),
              child: Image.asset(
                'assets/logo1.png',
                scale: 1.8,
              ),
            )),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Text(
                  'VAYU',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
              ),
            ),

            //White box
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )),
                  height: MediaQuery.of(context).size.height - 224),
            ),

            //Login text
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 240),
              child: Text(
                'LOGIN',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )),

            // email text field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Padding(
                padding: const EdgeInsets.only(top: 300),
                child: Stack(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 237, 237, 237),
                            borderRadius: BorderRadius.circular(20)),
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: 'Email'),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 20),
                      child: Image.asset('assets/user.png'),
                    )
                  ],
                ),
              ),
            ),

            //password text field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Padding(
                padding: const EdgeInsets.only(top: 370),
                child: Stack(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 237, 237, 237),
                            borderRadius: BorderRadius.circular(20)),
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: 'Password'),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 20),
                      child: Image.asset('assets/padlock.png'),
                    )
                  ],
                ),
              ),
            ),
            //login button

            Padding(
              padding: const EdgeInsets.only(top: 460),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: HexColor("#067F7B"),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: GestureDetector(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                    ),
                  ),
                ),
              ),
            ),

            //register button

            Padding(
              padding: const EdgeInsets.only(top: 525),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: HexColor("#067F7B"), width: 2),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: HexColor("#067F7B")),
                    ),
                  ),
                ),
              ),
            ),

            //Forgot password
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 600),
              child: Text(
                'Forgot Password?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )),

            //footer
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 680),
              child: Text(
                'VAYU Mobile App | CyberHealth | UNESCO INDIA AFRICA (UIA) Hackathon 2022',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
              ),
            ))
          ]),
        ]),
      ),
    );
  }
}
