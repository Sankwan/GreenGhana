import 'package:flutter/material.dart';

class RequestsDelivery extends StatelessWidget {
  const RequestsDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Request for a seedling', style: TextStyle( fontSize: 15),),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Fill in these for the receipt or \n delivery of your seedlings. NB These \n would be on bulk delivery basis',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text('Name', style: TextStyle(fontSize: 17)),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: TextField(
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'your name here...'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text('Number', style: TextStyle(fontSize: 17)),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: TextField(
              keyboardType: TextInputType.numberWithOptions(),
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'your reachable number'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text('Location', style: TextStyle(fontSize: 17)),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: TextField(
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'choose location'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text('Joint Location', style: TextStyle(fontSize: 17)),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: TextField(
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'choose location'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: TextButton(
              onPressed: (() {}),
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
