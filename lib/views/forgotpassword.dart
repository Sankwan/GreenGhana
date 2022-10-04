import 'package:first_application/models/authentication.dart';
import 'package:first_application/views/homescreen.dart';
import 'package:first_application/views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                  MaterialPageRoute(builder: ((context) => const Login())));
            }),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(children: [
          Container(
              height: _mediaQuery.size.height * 0.4,
              width: _mediaQuery.size.width * 1,
              decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('assets/images/g1.jpg')),
              )),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Forgot\nPassword?',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text(
              'Dont worry, it happens. Fill in the\nforms below to get a new password.'),
          const SizedBox(
            height: 20,
          ),
          const TextField(
            decoration:
                InputDecoration(hintText: 'username', icon: Icon(Icons.person)),
          ),
          const SizedBox(
            height: 10,
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: 'password',
              icon: Icon(
                Icons.security,
                color: Colors.grey,
              ),
            ),
            obscureText: true,
          ),
          const SizedBox(
            height: 10,
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: 'confirm password',
              icon: Icon(
                Icons.security,
                color: Colors.grey,
              ),
            ),
            obscureText: true,
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: (() {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => const Login())));
            }),
            child: Container(
              height: _mediaQuery.size.height * 0.08,
              width: _mediaQuery.size.width * 0.5,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Submit',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
//add a notification to say that the password has been changed successfully before
//returning to Login Page
