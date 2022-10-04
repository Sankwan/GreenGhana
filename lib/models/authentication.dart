import 'package:first_application/views/volta.dart';
import 'package:first_application/views/progress.dart';
import 'package:first_application/views/homescreen.dart';
import 'package:first_application/views/map.dart';
import 'package:first_application/views/requests.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';


//GreenTabs represent the bottom navigation tabs. 
class GreenTabs extends StatefulWidget {
  const GreenTabs({super.key});

  @override
  State<GreenTabs> createState() => _GreenTabsState();
}

class _GreenTabsState extends State<GreenTabs> {
  int currentTab = 0;
  final List<Widget> views = [
    Homescreen(),
    Requests(),
    Maps(),
    Progress(),
  ];

  Future pickImage() async {
    await ImagePicker().pickImage(source: ImageSource.camera);
  }

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Homescreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () => pickImage(),
          child: const Icon(
            Icons.camera,
            size: 40,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Homescreen();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: currentTab == 0 ? Colors.green : Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                              color:
                                  currentTab == 0 ? Colors.green : Colors.grey,
                              fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Requests();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.nature,
                          color: currentTab == 1 ? Colors.green : Colors.grey,
                        ),
                        Text(
                          'Requests',
                          style: TextStyle(
                            color: currentTab == 1 ? Colors.green : Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Maps();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.map,
                          color: currentTab == 2 ? Colors.green : Colors.grey,
                        ),
                        Text(
                          'Maps',
                          style: TextStyle(
                            color: currentTab == 2 ? Colors.green : Colors.grey,
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Progress();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.update,
                          color: currentTab == 3 ? Colors.green : Colors.grey,
                        ),
                        Text(
                          'Progress',
                          style: TextStyle(
                            color: currentTab == 3 ? Colors.green : Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// class FormValidator extends StatefulWidget {
//   final String username_error;
//   final String username_hinttext;
//   final String password_hinttext;
//   final String username_error_one;
//   final String username_error_two;
//   const FormValidator({
//     super.key,
//     required Column child,
//     required this.username_error,
//     required this.username_hinttext,
//     required this.password_hinttext,
//     required this.username_error_one,
//     required this.username_error_two,
//   });

//   @override
//   State<FormValidator> createState() => _FormValidatorState();
// }

// class _FormValidatorState extends State<FormValidator> {
//   bool _secureText = true;
// //the secureText is for the password validator 66 to 95, 128 to 135
//   final _formKey = GlobalKey<FormState>();
// //the formKey is to help the forms with the validation
//   TextEditingController _passwordController = TextEditingController();
//   var _passwordError;
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           TextFormField(
//             validator: (value) {
//               if (value!.isNotEmpty && value.length > 1) {
//                 return null;
//               } else if (value.isEmpty) {
//                 return 'Pls type your name';
//               } else {
//                 return null;
//               }
//             },
//             decoration:
//                 InputDecoration(hintText: 'username', icon: Icon(Icons.person)),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           TextFormField(
//               controller: _passwordController,
//               decoration: InputDecoration(
//                   hintText: 'password',
//                   icon: Icon(Icons.security),
//                   errorText: _passwordError,
//                   suffixIcon: IconButton(
//                     icon: const Icon(Icons.remove_red_eye),
//                     onPressed: () {
//                       setState(() {
//                         _secureText = !_secureText;
//                       });
//                     },
//                   )),
//               obscureText: _secureText,
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Enter Password';
//                 } else if (value.length < 5) {
//                   return 'Enter at least 5 characters';
//                 } else {
//                   return null;
//                 }
//               }),
//         ],
//       ),
//     );
//   }
// }



class Feed {
  final String feedurl;
  final String username;
  final String caption;
  final String location;
  final String likes;
  final String comments;

  Feed(this.feedurl, this.username, this.caption, this.location, this.likes,
      this.comments);
}


// class BasicGrid extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => StaggeredGridTile.count.(
//         staggeredTileBuilder: (index) => StaggeredTile.count(2,2),
//         mainAxisSpacing: 8,
//         crossAxisSpacing: 8,
//         crossAxisCount: 3,
//         itemCount: 50,
//         itemBuilder: (context, index) => buildImageCard(index),
//       );
//   Widget buildImageCard(int index) => Card(
//         margin: EdgeInsets.zero,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Container(
//           margin: EdgeInsets.all(8),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: Image.network(
//               'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2F2.bp.blogspot.com%2F-7_KFmNyUNvc%2FU1Ap8Aut4nI%2FAAAAAAAAAAo%2FUjOBfRzBtts%2Fs1600%2FDSCF1826.JPG&f=1&nofb=1&ipt=b2a54854fd1a78d1c5e11b6f254174de226fdcc09d4e386cb2150760b2cba2e8&ipo=images',
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//       );
// }

// class BasicGrid extends StatelessWidget {
//   const BasicGrid({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return StaggeredGrid.count(
//       crossAxisCount: 4,
//       mainAxisSpacing: 4,
//       crossAxisSpacing: 4,
//       children: [
//         StaggeredGridTile.count(
//           crossAxisCellCount: 2,
//           mainAxisCellCount: 2,
//           child: Container(
//             margin: EdgeInsets.all(8),
//             child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.network(
//                   'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2F2.bp.blogspot.com%2F-7_KFmNyUNvc%2FU1Ap8Aut4nI%2FAAAAAAAAAAo%2FUjOBfRzBtts%2Fs1600%2FDSCF1826.JPG&f=1&nofb=1&ipt=b2a54854fd1a78d1c5e11b6f254174de226fdcc09d4e386cb2150760b2cba2e8&ipo=images',
//                   fit: BoxFit.cover,
//                 )),
//           ),
//         ),
//         StaggeredGridTile.count(
//           crossAxisCellCount: 2,
//           mainAxisCellCount: 1,
//           child: Container(
//             margin: EdgeInsets.all(8),
//             child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.network(
//                   'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2F2.bp.blogspot.com%2F-7_KFmNyUNvc%2FU1Ap8Aut4nI%2FAAAAAAAAAAo%2FUjOBfRzBtts%2Fs1600%2FDSCF1826.JPG&f=1&nofb=1&ipt=b2a54854fd1a78d1c5e11b6f254174de226fdcc09d4e386cb2150760b2cba2e8&ipo=images',
//                   fit: BoxFit.cover,
//                 )),
//           ),
//         ),
//         StaggeredGridTile.count(
//           crossAxisCellCount: 1,
//           mainAxisCellCount: 1,
//           child: Container(
//             margin: EdgeInsets.all(8),
//             child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.network(
//                   'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2F2.bp.blogspot.com%2F-7_KFmNyUNvc%2FU1Ap8Aut4nI%2FAAAAAAAAAAo%2FUjOBfRzBtts%2Fs1600%2FDSCF1826.JPG&f=1&nofb=1&ipt=b2a54854fd1a78d1c5e11b6f254174de226fdcc09d4e386cb2150760b2cba2e8&ipo=images',
//                   fit: BoxFit.cover,
//                 )),
//           ),
//         ),
//         StaggeredGridTile.count(
//           crossAxisCellCount: 1,
//           mainAxisCellCount: 1,
//           child: Container(
//             margin: EdgeInsets.all(8),
//             child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.network(
//                   'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2F2.bp.blogspot.com%2F-7_KFmNyUNvc%2FU1Ap8Aut4nI%2FAAAAAAAAAAo%2FUjOBfRzBtts%2Fs1600%2FDSCF1826.JPG&f=1&nofb=1&ipt=b2a54854fd1a78d1c5e11b6f254174de226fdcc09d4e386cb2150760b2cba2e8&ipo=images',
//                   fit: BoxFit.cover,
//                 )),
//           ),
//         ),
//         StaggeredGridTile.count(
//           crossAxisCellCount: 4,
//           mainAxisCellCount: 2,
//           child: Container(
//             margin: EdgeInsets.all(8),
//             child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.network(
//                   'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2F2.bp.blogspot.com%2F-7_KFmNyUNvc%2FU1Ap8Aut4nI%2FAAAAAAAAAAo%2FUjOBfRzBtts%2Fs1600%2FDSCF1826.JPG&f=1&nofb=1&ipt=b2a54854fd1a78d1c5e11b6f254174de226fdcc09d4e386cb2150760b2cba2e8&ipo=images',
//                   fit: BoxFit.cover,
//                 )),
//           ),
//         ),
//       ],
//     );
//   }
// }

// Widget masonGrid(BuildContext context) {
//   return Container(
//     child: MasonryGridView.builder(
//         shrinkWrap: true,
//         scrollDirection: Axis.vertical,
//         crossAxisSpacing: 8,
//         mainAxisSpacing: 6,
//         gridDelegate:
//             SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemCount: 30,
//         itemBuilder: (context, index) {
//           return ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child:
//                 Image.network('https://source.unsplash.com/random?sig=$index'),
//           );
//         }),
//   );
// }

// class myGrid extends StatelessWidget {
//   const myGrid({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       shrinkWrap: true,
//       crossAxisCount: 3,
//       mainAxisSpacing: 10,
//       crossAxisSpacing: 10,
//       scrollDirection: Axis.vertical,
//       padding: const EdgeInsets.all(10),
//       children: [
//         InkWell(
//           child: Container(
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: NetworkImage(
//                         'https://www.wantedinafrica.com/i/preview/storage/uploads/2018/10/Accra.jpg'),
//                     fit: BoxFit.fill)),
//           ),
//           onTap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => const Accra()));
//           },
//         ),
//         InkWell(
//           child: Container(
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: NetworkImage(
//                         'https://pbs.twimg.com/media/EbqM5xhWAAAmxHA.jpg:large'),
//                     fit: BoxFit.fill)),
//           ),
//           onTap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => const Ashanti()));
//           },
//         ),
//         InkWell(
//           child: Container(
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: NetworkImage(
//                         'https://i0.wp.com/viewghana.com/wp-content/uploads/2018/03/Eastern_Region_Ghana_Main.png?fit=1316%2C744&ssl=1'),
//                     fit: BoxFit.fill)),
//           ),
//           onTap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => const Eastern()));
//           },
//         ),
//         InkWell(
//           child: Container(
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: NetworkImage(
//                         'https://koppan.com/wp-content/uploads/2019/06/western.jpeg'),
//                     fit: BoxFit.fill)),
//           ),
//           onTap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => const Western()));
//           },
//         ),
//         InkWell(
//           child: Container(
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: NetworkImage(
//                         'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/5b/1b/fd/caption.jpg?w=500&h=300&s=1'),
//                     fit: BoxFit.fill)),
//           ),
//           onTap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => const Volta()));
//           },
//         ),
//         InkWell(
//           child: Container(
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: NetworkImage(
//                         'https://visitghana.com/wp-content/uploads/2019/05/4166_Elmina-Castle-Ghana-1990s.jpg'),
//                     fit: BoxFit.fill)),
//           ),
//           onTap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => const Central()));
//           },
//         ),
//       ],
//     );
//   }
// }


