import 'package:first_application/models/authentication.dart';
import 'package:first_application/views/profile.dart';
import 'package:first_application/views/videodetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: (() {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const Profile())));
            }),
            child: const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/g1.jpg'),
            ),
          ),
        ),
        title: const Text(
          'Green Ghana',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: PageView.builder(
          onPageChanged: (int page) => {('Page changed to $page')},
          scrollDirection: Axis.vertical,
          itemCount: 20,
          itemBuilder: ((context, index) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  color: Colors.green,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 4,
                        child: const VideoDetail(
                          feedurl: '',
                          username: '',
                          caption: '',
                          location: '',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2.2,
                        child: const HomeSidebar(
                          likes: '',
                          comments: '',
                          widget: '',
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
          })),
    );
  }
}
