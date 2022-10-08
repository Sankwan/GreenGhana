import 'package:first_application/models/authentication.dart';
import 'package:first_application/views/login.dart';
import 'package:first_application/views/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _secureText = true;
//the secureText is for the password validator 66 to 95, 128 to 135
  final _formKey = GlobalKey<FormState>();
//the formKey is to help the forms with the validation
  TextEditingController _passwordController = TextEditingController();
  var _passwordError;



  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(children: [
          Container(
              height: _mediaQuery.size.height * 0.4,
              width: _mediaQuery.size.width * 1,
              decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('assets/images/fclogo.png')),
              )),
          const SizedBox(
            height: 0,
          ),
          const Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isNotEmpty && value.length > 2) {
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
                        icon: Icon(Icons.security),
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
          const SizedBox(
            height: 30,
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
                  if (_passwordController.text.isEmpty)
                    _passwordError = 'Enter Password';
                  else if (_passwordController.text.isNotEmpty &&
                      _passwordController.text.length < 5)
                    _passwordError = 'Enter at least 5 characters';
                  else
                    _passwordError = null;

                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                });
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) => const Otp())));
              }),
              // child: Container(
              //   height: _mediaQuery.size.height * 0.08,
              //   width: _mediaQuery.size.width * 0.5,
              //   decoration: BoxDecoration(
              //     color: Colors.green,
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child: const Padding(
              //     padding: EdgeInsets.only(top: 10),
              //     child: Text(
              //       'Sign Up',
              //       textAlign: TextAlign.center,
              //       style: TextStyle(color: Colors.white, fontSize: 25),
              //     ),
              //   ),
              // ),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
          SizedBox(
            height: _mediaQuery.size.height *0.01,
          ),
          const Text(
            'Or',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ), 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/l2.png'), fit: BoxFit.contain), shape: BoxShape.circle),
              ),
              SizedBox(
                width:_mediaQuery.size.width *0.2 ,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/l1.png'), fit: BoxFit.contain),
                    shape: BoxShape.circle),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 90),
            child: Row(
              children: [
               const Text('Already joined us?'),
                TextButton(
                    onPressed: (() {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const Login())));
                    }),
                    child:const Text(
                      'Login',
                      style: TextStyle(color: Colors.green),
                    ))
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
