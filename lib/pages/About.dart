import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const About());
}

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool usVisible = false;
  bool buzzVisible = true;
  bool aboutBuzz = false;
  bool aboutUs = true;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color(0xff141d26),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_outlined),
                color: Colors.white,
                iconSize: 30,
              ),
            ),
            Visibility(
              visible: aboutUs,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 70, 0, 40),
                    child: Text(
                      "Meet Co-founders",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                        fontSize: 28,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  // const Padding(
                  //   padding: EdgeInsets.fromLTRB(30, 10, 0, 50),
                  //   child: Text(
                  //     "let’s start buzzin’",
                  //     textAlign: TextAlign.start,
                  //     overflow: TextOverflow.clip,
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.w400,
                  //       fontStyle: FontStyle.normal,
                  //       fontSize: 24,
                  //       color: Color(0xff6080a7),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: CarouselSlider.builder(
                      itemCount:
                          3, // Number of carousel items (adjust as needed)
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Container(
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.zero,
                              width: screenWidth - 50,
                              height: screenHeight - 490,
                              decoration: BoxDecoration(
                                color: const Color(0xff212552),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(
                                    color: const Color(0x4d9e9e9e), width: 1),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 3, 20, 0),
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              bottom: 4, top: 4),
                                          height: 90,
                                          width: 70,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                              "lib\\Assets\\ieee.jpg"),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 0, 0, 0),
                                        child: MaterialButton(
                                          onPressed: () {},
                                          color: const Color(0xff141d26),
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(33.0),
                                            side: const BorderSide(
                                                color: Color(0xff6080a7),
                                                width: 1),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8),
                                          textColor: const Color(0xffffffff),
                                          height: 40,
                                          minWidth: 140,
                                          child: const Text(
                                            "Connect",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                                    child: Text(
                                      "Ibraheem Haseeb",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 22,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                    child: Text(
                                      "Hey there!👋 I'm Ibraheem Haseeb, a passionate student and dedicated coder who finds joy in the world of programming and technology. I'm constantly fascinated by the limitless possibilities that coding offers to shape the future. 🚀",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 17,
                                        color: Color(0xff9c9c9c),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else if (index == 1) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Container(
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.zero,
                              width: screenWidth - 50,
                              height: screenHeight - 490,
                              decoration: BoxDecoration(
                                color: const Color(0xff212552),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(
                                    color: const Color(0x4d9e9e9e), width: 1),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 3, 20, 0),
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              bottom: 4, top: 4),
                                          height: 90,
                                          width: 70,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                              "lib\\Assets\\abdu.jpg"),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 0, 0, 0),
                                        child: MaterialButton(
                                          onPressed: () {},
                                          color: const Color(0xff141d26),
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(33.0),
                                            side: const BorderSide(
                                                color: Color(0xff6080a7),
                                                width: 1),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8),
                                          textColor: const Color(0xffffffff),
                                          height: 40,
                                          minWidth: 140,
                                          child: const Text(
                                            "Connect",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                                    child: Text(
                                      "Abdullah Sajjad",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 22,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                    child: Text(
                                      "Hey! 🤖 This is Abdullah Sajjad, Armed with a keyboard as my trusty sidearm, I venture into the labyrinth of code, wielding my logic like a sword and my creativity like a shield. Websites and apps emerge from the chaos, a testament to my audacious spirit.",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18,
                                        color: Color(0xff9c9c9c),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else if (index == 2) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Container(
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.zero,
                              width: screenWidth - 50,
                              height: screenHeight - 490,
                              decoration: BoxDecoration(
                                color: const Color(0xff212552),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(
                                    color: const Color(0x4d9e9e9e), width: 1),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 3, 20, 0),
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              bottom: 4, top: 4),
                                          height: 90,
                                          width: 70,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                              "lib\\Assets\\musaImage.png"),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 0, 0, 0),
                                        child: MaterialButton(
                                          onPressed: () {},
                                          color: const Color(0xff141d26),
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(33.0),
                                            side: const BorderSide(
                                                color: Color(0xff6080a7),
                                                width: 1),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8),
                                          textColor: const Color(0xffffffff),
                                          height: 40,
                                          minWidth: 140,
                                          child: const Text(
                                            "Connect",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                                    child: Text(
                                      "Musa Raza",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 22,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                    child: Text(
                                      "Hi Guys! 👋 This is Musa Raza, your friendly neighborhood student and coding crusader, here to turn caffeine into code and dreams into digital reality. Strap in for a wild ride. 🚀",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18,
                                        color: Color(0xff9c9c9c),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                        return widget;
                      },
                      options: CarouselOptions(
                          scrollPhysics: const ClampingScrollPhysics(),
                          aspectRatio: 3 / 3.3,
                          enlargeCenterPage: false,
                          enableInfiniteScroll: false),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: aboutBuzz,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 70, 0, 40),
                    child: Text(
                      "About Buzzats",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                        fontSize: 28,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  // const Padding(
                  //   padding: EdgeInsets.fromLTRB(30, 10, 0, 50),
                  //   child: Text(
                  //     "let’s start buzzin’",
                  //     textAlign: TextAlign.start,
                  //     overflow: TextOverflow.clip,
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.w400,
                  //       fontStyle: FontStyle.normal,
                  //       fontSize: 24,
                  //       color: Color(0xff6080a7),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: CarouselSlider.builder(
                      itemCount:
                          1, // Number of carousel items (adjust as needed)
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Container(
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.zero,
                              width: screenWidth - 50,
                              height: screenHeight - 490,
                              decoration: BoxDecoration(
                                color: const Color(0xff212552),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(
                                    color: const Color(0x4d9e9e9e), width: 1),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(20, 45, 20, 0),
                                    child: Text(
                                      "We're excited to introduce you to a dynamic platform designed to enhance your campus experience.Through a user-friendly interface, real-time event updates, interest-based groups, and interactive features, we're committed to making your time at university unforgettable. Join us in building a strong, interconnected campus community where friendships flourish, ideas are exchanged, and memories are created - all within the palm of your hand. Welcome to a new era of university socializing!",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 17,
                                        color: Color(0xff9c9c9c),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                        return widget;
                      },
                      options: CarouselOptions(
                          scrollPhysics: const ClampingScrollPhysics(),
                          aspectRatio: 3 / 3.3,
                          enlargeCenterPage: false,
                          enableInfiniteScroll: false),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(110, 70, 0, 0),
              child: Container(
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.fromLTRB(8, 5, 5, 5),
                width: 170,
                height: 41,
                decoration: BoxDecoration(
                  color: const Color(0xff141d26),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(11.0),
                  border: Border.all(color: const Color(0xff96b7df), width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Visibility(
                        visible: usVisible,
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              buzzVisible = true;
                              usVisible = false;
                              aboutBuzz = false;
                              aboutUs = true;
                            });
                          },
                          color: const Color(0xff5a738b),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: const BorderSide(
                                color: Color(0xff808080), width: 1),
                          ),
                          padding: const EdgeInsets.all(14),
                          textColor: const Color(0xffffffff),
                          height: 25,
                          minWidth: 40,
                          child: const Text(
                            "Founders",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                      child: Visibility(
                        visible: buzzVisible,
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              buzzVisible = false;
                              usVisible = true;
                              aboutUs = false;
                              aboutBuzz = true;
                            });
                          },
                          color: const Color(0xff5a738b),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: const BorderSide(
                                color: Color(0xff808080), width: 1),
                          ),
                          padding: const EdgeInsets.all(14),
                          textColor: const Color(0xffffffff),
                          height: 20,
                          child: const Text(
                            "Buzzats",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
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
}
