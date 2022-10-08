import 'package:first_application/models/authentication.dart';
import 'package:first_application/views/homescreen.dart';
import 'package:first_application/views/login.dart';
import 'package:first_application/views/signup.dart';
import 'package:flutter/material.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        leading: IconButton(
            onPressed: (() {
              Navigator.pop(context,
                  MaterialPageRoute(builder: ((context) => const SignUp())));
            }),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: _mediaQuery.size.height * 0.02,
          ),
          const Text(
            'Enter OTP',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: _mediaQuery.size.height * 0.02,
          ),
          const Text(
            'A 6 digit code has been sent\nto (+233 557889480)',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: _mediaQuery.size.height * 0.3,
          ),
          const Text(
            'Resend Code',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green),
          ),
          SizedBox(
            height: _mediaQuery.size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: TextButton(
              onPressed: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const HomeScreenTabs())));
              }),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Next',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//add a notificaton to the text button to verify or reject otp