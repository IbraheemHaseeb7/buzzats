import 'dart:async';

import 'package:flutter/material.dart';

class ImageOverlay extends StatefulWidget {
  Image image;
  OverlayEntry overlayEntry;
  ImageOverlay({super.key, required this.image, required this.overlayEntry});

  @override
  createState() => ImageOverlayState();
}

class ImageOverlayState extends State<ImageOverlay> {
  double top = 1000;

  @override
  void initState() {
    super.initState();

    showImage();
  }

  void showImage() {
    Timer(const Duration(milliseconds: 100), () {
      setState(() {
        top = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return AnimatedPositioned(
        curve: Curves.ease,
        duration: const Duration(milliseconds: 300),
        top: top,
        left: 0,
        child: GestureDetector(
            onTap: () {
              closeImage(context);
            },
            child: SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: Center(
                child: SizedBox(
                  width: screenWidth - 20,
                  height: screenHeight - 20,
                  child: widget.image,
                ),
              ),
            )));
  }

  void closeImage(BuildContext context) {
    setState(() {
      top = 1000;
    });
    Timer(const Duration(milliseconds: 500), () {
      widget.overlayEntry.remove();
    });
  }
}

class ImagePopup {
  late OverlayEntry overlayEntry;
  Image image;
  ImagePopup({required this.image});

  void openImage(BuildContext context) {
    overlayEntry = OverlayEntry(
        builder: (context) =>
            ImageOverlay(image: image, overlayEntry: overlayEntry));

    Overlay.of(context).insert(overlayEntry);
  }
}
