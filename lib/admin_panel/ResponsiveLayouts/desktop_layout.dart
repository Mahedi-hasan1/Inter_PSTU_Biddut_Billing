import 'package:e_bill/admin_panel/houseTab/houseView/allhouseView.dart';
import 'package:e_bill/admin_panel/unitCostTab/unitCostView.dart';
import 'package:e_bill/admin_panel/usersTab/userView/userList.dart';
import 'package:e_bill/constants/responsive_constants.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatefulWidget {
  DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {

  final PageController _pageController = PageController();

  int _index = 0;

  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String adminName = "bot";
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Drawer(
              backgroundColor: defaultColor,
              child: Column(
                children: [
                  const DrawerHeader(child: Text("Good day, Admin")),
                  ListTile(
                    leading: const Icon(Icons.home_work,),
                    title: const Text("H O U S E S"),
                    onTap: (){
                      setState(() {
                      _index = 0;
                    });
                    _pageController.jumpToPage(0);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.monetization_on,),
                    title: const Text("U N I T C O S T"),
                    onTap: (){
                      setState(() {
                      _index = 1;
                    });
                    _pageController.jumpToPage(1);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person_2_rounded,),
                    title: const Text("U S E R S"),
                    onTap: (){
                      setState(() {
                      _index = 2;
                    });
                    _pageController.jumpToPage(2);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.message_outlined,),
                    title: const Text("C O M P L A I N S"),
                    onTap: (){
                      setState(() {
                      _index = 3;
                    });
                    _pageController.jumpToPage(3);
                    },
                  ),
                  Scaffold(
                    backgroundColor: Colors.black,
                    appBar: AppBar(
                      title: const Center(
                          child: Text(
                        "C o n t r o l  P a n e l",
                        style: TextStyle(color: Colors.white),
                      )),
                      backgroundColor: Colors.black,
                     ),
                    body: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: PageView.builder(
                        itemCount: 4,
                        controller: _pageController,
                        onPageChanged: (page) {
                          setState(() {
                            _index = page;
                          });
                        },
                        itemBuilder: (context, page) {
                          print(page);
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 4, color: Colors.white70),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: chooseBot(context, page),
                          );
                        },
                      ),
                    ),
                      ),
                    ],
                          ),
                        ),
          ),

                    ],
                  ),
                );
  }

  Widget userComplains(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.orange.shade300,
      ),
    );
  }

  Widget chooseBot(BuildContext context, int pageIndex) {
    if (pageIndex == 0) return const AllHouseView();
    if (pageIndex == 1) return const UnitCostView();
    if (pageIndex == 2) {
      return const UserList();
    } else {
      return userComplains(context);
    }
  }
}