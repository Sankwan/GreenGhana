import 'package:first_application/models/authentication.dart';
import 'package:first_application/views/forgotpassword.dart';
import 'package:first_application/views/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _secureText = true;
//the secureText is for the password validator 66 to 95, 128 to 135
  final _formKey = GlobalKey<FormState>();
//the formKey is to help the forms with the validation
  final TextEditingController _passwordController = TextEditingController();
  var _passwordError;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(children: [
          Container(
              height: mediaQuery.size.height * 0.4,
              width: mediaQuery.size.width * 1,
              decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('assets/images/g2.jpg')),
              )),
          const Text(
            'Login',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isNotEmpty && value.length > 1) {
                      return null;
                    } else if (value.isEmpty) {
                      return 'Pls type your name';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                      hintText: 'username', icon: Icon(Icons.person)),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        hintText: 'password',
                        icon: const Icon(Icons.security),
                        errorText: _passwordError,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.remove_red_eye),
                          onPressed: () {
                            setState(() {
                              _secureText = !_secureText;
                            });
                          },
                        )),
                    obscureText: _secureText,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Password';
                      } else if (value.length < 5) {
                        return 'Enter at least 5 characters';
                      } else {
                        return null;
                      }
                    }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 200),
            child: TextButton(
              onPressed: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const ForgotPassword())));
              }),
              child: const Text(
                'Forgot Password?',
                style: TextStyle(fontSize: 15, color: Colors.green),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: TextButton(
              // onPressed: (() {
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: ((context) => const Otp())));
              // }),
              onPressed: (() {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                print('Password :' + _passwordController.text);
                setState(() {
                  if (_passwordController.text.isEmpty) {
                    _passwordError = 'Enter Password';
                  } else if (_passwordController.text.isNotEmpty &&
                      _passwordController.text.length < 5) {
                    _passwordError = 'Enter at least 5 characters';
                  } else {
                    _passwordError = null;
                  }

                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                });
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const HomeScreenTabs())));
              }),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              'Or',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/l2.png'),
                        fit: BoxFit.contain),
                    shape: BoxShape.circle),
              ),
              SizedBox(
                width: mediaQuery.size.width * 0.2,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/l1.png'),
                        fit: BoxFit.contain),
                    shape: BoxShape.circle),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 70),
            child: Row(
              children: [
                const Text('New to Green Ghana?'),
                TextButton(
                    onPressed: (() {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const SignUp())));
                    }),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.green),
                    ))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
