import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  bool isClicked = true;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        // appBar: PreferredSize(
        //   preferredSize: Size(100, 80), //width and height
        //   // The size the AppBar would prefer if there were no other constraints.
        //   child: SafeArea(
        //     child: Container(
        //       height: 30,
        //       color: Colors.white,
        //       child: Center(child: Text('Fluter is great')),
        //     ),
        //   ),
        // ),
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back),
                  Text("AP Process"),
                  Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            ExpansionTile(
              trailing: SizedBox.shrink(),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: isClicked,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(FontAwesomeIcons.chevronDown),
                    ),
                  ),
                ],
              ),
              children: [
                Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 300,
                          width: screenWidth,
                          color: Colors.blue,
                        ),
                        Visibility(
                          visible: isClicked,
                          child: Positioned(
                            top: 250,
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(FontAwesomeIcons.chevronUp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
