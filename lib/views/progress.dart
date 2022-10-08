import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('2023 Progress', style: TextStyle(color: Colors.white, fontSize: 15),),
        centerTitle: true,
      ),
    );
  }
}
