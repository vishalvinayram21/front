import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phone/tab_screens/health_screen.dart';
import 'package:phone/tab_screens/tab_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownValue = 'Koramangala, Bangalore';
  List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
  String _selectedLocation = 'fx';
  String _value = 'one';
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: menu(context),
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(36)),
                  elevation: 10,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 242,
                    height: 40,
                    child: DropdownButton<String>(
                      alignment: AlignmentDirectional.topStart,
                      isExpanded: true,
                      underline: SizedBox(),
                      value: _value,
                      items: <DropdownMenuItem<String>>[
                        DropdownMenuItem(
                          child: Text('Koramangala, Bangalore'),
                          value: 'one',
                        ),
                        DropdownMenuItem(
                            child: Text('Nuzvid,Vijayawada'), value: 'two'),
                      ],
                      onChanged: (String? value) {
                        setState(() => _value = value!);
                      },
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              Container(
                width: 25,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // border:
                  // Border.all(width: 1, color: Theme.of(context).primaryColor),
                  // borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).primaryColor,
                ),
                child: Image.asset(
                  'assets/home/Menu.png',
                  width: 14,
                  height: 14,
                  color: Colors.white,
                  // fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 25,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // border:
                  // Border.all(width: 1, color: Theme.of(context).primaryColor),
                  // borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).primaryColor,
                ),
                child: Image.asset(
                  'assets/home/Bell 16px.png',
                  width: 14,
                  height: 14,
                  color: Colors.white,
                  // fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 10)
            ],
          ),
          body: TabBarView(
            children: [
              TabHome(),
              Center(child: Text('My health')),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GoogleFit(),
                      ),
                    );
                  },
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      height: 54,
                      width: 200,
                      child: Text(
                        'Download health data',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

// Container busStopBoring(BuildContext context) {
//   return Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(30),
//       color: Theme.of(context).primaryColor,
//     ),
//     child:const  Icon(Icons.abc, size: 14,),
//   );
// }

// TabBarView(
//             children: [
//               Center(child: Text('Dashboard')),
//               Center(child: Text('My health')),
//               InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => HealthApp(),
//                       ),
//                     );
//                   },
//                   child: Center(
//                     child: Container(
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.circular(20)),
//                       height: 54,
//                       width: 200,
//                       child: Text(
//                         'Download health data',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ))
//             ],
//           ),

// ListView(
//         children: [
//           Container(
//             padding: EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 SizedBox(height: 15),
//                 Text(
//                   'Hello, User',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   'Displaying your favourite data',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       )

Widget menu(BuildContext context) {
  return Container(
    child:  TabBar(// labelColor: Ap,
      unselectedLabelColor: Colors.grey,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding: EdgeInsets.all(5.0),
      indicatorColor: Colors.black,
      tabs: [
        Tab(
          text: "My health",
          icon:Icon(Icons.pending,color: Color.fromRGBO(155, 144, 255, 1),
          ),
        ),
        Tab(
          text: "MyGroup",
          icon: Icon(Icons.group,color: Color.fromRGBO(155, 144, 255, 1),)),

        Tab(
          text: "Assistance",
          icon: Icon(Icons.doorbell,color: Color.fromRGBO(155, 144, 255, 1),),
        ),
      ],
    ),
  );
}
