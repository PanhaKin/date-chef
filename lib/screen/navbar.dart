import 'package:dating_chef/screen/history.dart';
import 'package:dating_chef/screen/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  late bool navbarView = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: SingleChildScrollView(
        child: Container(
            height: height,
            width: width,
            child: Stack(
              children: [
                if (!navbarView) ...[
                  Homepage(),
                ] else ...[
                  History(),
                ],
                Positioned(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.only(
                          bottom: 20, left: 50, right: 50),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: 45,
                      width: width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                navbarView = false;
                              });
                            },
                            icon: Icon(
                              Icons.home,
                              size: 30,
                              color: navbarView == false
                                  ? Color(0xfffe813a)
                                  : Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                navbarView = true;
                              });
                            },
                            icon: Icon(
                              Icons.history,
                              size: 30,
                              color: navbarView == true
                                  ? Color(0xfffe813a)
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
