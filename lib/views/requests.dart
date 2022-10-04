import 'package:first_application/models/authentication.dart';
import 'package:first_application/views/homescreen.dart';
import 'package:first_application/views/requests_delivery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Requests extends StatefulWidget {
  const Requests({super.key});

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Requests'),
        centerTitle: true,
        // leading: IconButton(onPressed: (() {
        //         Navigator.pop(
        //             context,
        //             MaterialPageRoute(
        //                 builder: ((context) => const Homescreen())));
        //       }), icon: Icon(Icons.arrow_back))
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
         const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              'What we have',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Container(
              height: 200,
              width: 20,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:const [
                  Text(
                    'Teak',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    'Pear',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    'Coconut',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    'Lorem Ipsum',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    'Lorem Ipsum',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    'Lorem Ipsum',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
         const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text('Quantity', style: TextStyle(fontSize: 20)),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'not more than 10 each'),
            ),
          ),
         const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: TextButton(
              onPressed: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const RequestsDelivery())));
              }),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Proceed',
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
