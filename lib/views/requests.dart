import 'package:first_application/models/authentication.dart';
import 'package:first_application/views/homescreen.dart';
import 'package:first_application/views/requests_delivery.dart';
import 'package:flutter/material.dart';

class Requests extends StatefulWidget {
  const Requests({super.key});

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  List items = [];

  var firstKey = 1;
  var secondKey = 2;
  var thirdKey = 3;

  // Initial Selection for seedlings
  String initVal = 'Opt A';

  // List of options
  var options = ['Opt A', 'Opt B', 'Opt C'];

  //  Add to List
  addCategory(value) {
    items.add(value);
  }

  // List 2
  List regions = [];
  // Initial Selection for location
  String initReg = 'Greater Accra';
  //list of options in dropdown
  var optionsRegion = ['Greater Accra', 'Western', 'Ashanti'];

  // List 2
  List locations = [];
  // Initial Selection for location
  String initLoc = 'Forestry Commission HQ';
  //list of options in dropdown
  var optionsLocation = ['Accra Mall', 'WestHills', 'Junction Mall'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Request for a seedling',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        centerTitle: true,
        // leading: IconButton(onPressed: (() {
        //         Navigator.pop(
        //             context,
        //             MaterialPageRoute(
        //                 builder: ((context) => const Homescreen())));
        //       }), icon: Icon(Icons.arrow_back))
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),

            //  Header  //
            const Text(
              'Seedlings we have',
              style: TextStyle(fontSize: 17),
            ),

            Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Text(items[index]);
              },
            )),

            // Padding(
            //   padding: const EdgeInsets.only(left: 40),
            //   child: Container(
            //     height: 200,
            //     width: 20,
            //     color: Colors.transparent,
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: const [
            //         Text(
            //           'Teak',
            //           style: TextStyle(fontSize: 15),
            //         ),
            //         Text(
            //           'Pear',
            //           style: TextStyle(fontSize: 15),
            //         ),
            //         Text(
            //           'Coconut',
            //           style: TextStyle(fontSize: 15),
            //         ),
            //         Text(
            //           'Lorem Ipsum',
            //           style: TextStyle(fontSize: 15),
            //         ),
            //         Text(
            //           'Lorem Ipsum',
            //           style: TextStyle(fontSize: 15),
            //         ),
            //         Text(
            //           'Lorem Ipsum',
            //           style: TextStyle(fontSize: 15),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            DropdownButton(
              value: initVal,
              isExpanded: true,
              icon:const Icon(Icons.keyboard_arrow_down),
              items: options.map((options) {
                return DropdownMenuItem(
                  value: options, 
                  child: Text(options)
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  initVal = newValue!;
                  addCategory(newValue);
                });
              },
            ),
            const SizedBox(
              height: 40,
            ),
            const Text('Quantity', style: TextStyle(fontSize: 17)),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'not more than 10 each',
                  hintStyle: TextStyle(fontSize: 14)),
            ),
            const SizedBox(
              height: 40,
            ),
            //  Header  //
            const Text(
              'Region',
              style: TextStyle(fontSize: 17),
            ),
            //dropdown to select regions. Gives an error
            //error1 is here

            // DropdownButton(
            //   value: initReg,
            //   isExpanded: true,
            //   icon:const Icon(Icons.keyboard_arrow_down),
            //   items: optionsRegion.map((optionsRegion) {
            //     return DropdownMenuItem(
            //         value: optionsRegion, 
            //         child: Text(optionsRegion)
            //     );
            //   }).toList(),
            //   onChanged: (String? value) {
            //     setState(() {
            //       initReg = value!;
            //     });
            //   },
            // ),
            const SizedBox(
              height: 40,
            ),
            //  Header  //
            const Text(
              'Location to receive seedlings',
              style: TextStyle(fontSize: 17),
            ),
            //dropdown to select specific location
            //error2 is here

            // DropdownButton(
            //   value: initLoc,
            //   isExpanded: true,
            //   icon:const Icon(Icons.keyboard_arrow_down),
            //   items: optionsLocation.map((optionsLocation) {
            //     return DropdownMenuItem(
            //         value: optionsLocation, child: Text(optionsLocation));
            //   }).toList(),
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       initLoc = newValue!;
            //     });
            //   },
            // ),
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
      ),
    );
  }
}
