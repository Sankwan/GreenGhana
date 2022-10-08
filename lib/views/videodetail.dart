import 'dart:math';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class VideoDetail extends StatelessWidget {
  final String feedurl;
  final String username;
  final String caption;
  final String location;

  const VideoDetail({
    Key? key,
    required this.feedurl,
    required this.username,
    required this.caption,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            '@loveExperience',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          const ExpandableText(
            'video caption goes here, video caption goes here, video caption goes here saaaaaaa and video caption goes here saaaaa la, video caption goes here saaaaaaa and video caption goes here saaaaa la',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 13),
            expandText: 'more',
            collapseText: 'less',
            expandOnTextTap: true,
            collapseOnTextTap: true,
            maxLines: 2,
            linkColor: Colors.blue,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Icon(
                CupertinoIcons.location_solid,
                size: 17,
                color: Colors.white,
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 20,
                width: MediaQuery.of(context).size.width / 2.5,
                child: Marquee(
                  text: 'location - Nyankpala  .  ',
                  velocity: 20,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

//this is the field for the side bar which contains the likes, comments and share
class HomeSidebar extends StatefulWidget {
  final String likes;
  final String comments;
  final dynamic widget;
  const HomeSidebar({
    Key? key,
    required this.likes,
    required this.comments,
    required this.widget,
  }) : super(key: key);

  @override
  State<HomeSidebar> createState() => _HomeSidebarState();
}

class _HomeSidebarState extends State<HomeSidebar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 8),
    );
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: const [
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.favorite,
                  size: 35,
                  color: Colors.white,
                )),
            Text(
              '10K',
              style: TextStyle(color: Colors.white, fontSize: 13),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: const [
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.comment,
                  size: 35,
                  color: Colors.white,
                )),
            Text('2K', style: TextStyle(color: Colors.white, fontSize: 13))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: const [
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.share,
                  size: 35,
                  color: Colors.white,
                )),
            Text('share', style: TextStyle(color: Colors.white, fontSize: 13))
          ],
        ),
        const SizedBox(
          height: 100,
        ),
        AnimatedBuilder(
            animation: _animationController,
            child: Stack(
              children: [
                Container(
                    height: 50,
                    width: 50,
                    child: Image.asset('assets/images/glogo.png')),
              ],
            ),
            builder: ((context, child) {
              return Transform.rotate(
                angle: 2 * pi * _animationController.value,
                child: child,
              );
            }))
      ],
    );
  }
}
