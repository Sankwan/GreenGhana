import 'package:first_application/models/authentication.dart';
import 'package:first_application/views/forgotpassword.dart';
import 'package:first_application/views/homescreen.dart';
import 'package:first_application/views/login.dart';
import 'package:first_application/views/otp.dart';
import 'package:first_application/views/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const SignUp(),
    );
  }
}

