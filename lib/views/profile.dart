import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

//still building the profile page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(''),
        centerTitle: true,
        actions:const [
         IconButton(onPressed: null, icon: Icon(Icons.more_vert)
      )],
      ),
      body: ListView(
        children: [
        const  SizedBox(
            height: 20,
          ),
        const  CircleAvatar(
            backgroundColor: Colors.green,
            radius: 50,
          ),
        const  Text(''),
        const  SizedBox(
            height: 20,
          ),
          Row(

          )
        ],
      ),
    );
  }
}