import 'package:flutter/material.dart';
import 'package:flutter_app_1/pages/OTP.dart';
import 'package:flutter_app_1/pages/PhoneNum.dart';
import 'package:flutter_app_1/pages/Signup.dart';

class GettingStarted extends StatefulWidget {
  const GettingStarted({super.key});

  @override
  _GettingStarted createState() => _GettingStarted();
}

class _GettingStarted extends State<GettingStarted> {
  final pageController = PageController();

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void previousPage() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      children: [
        Signup(nextPage: nextPage, previousPage: previousPage),
        OTP(nextPage: nextPage, previousPage: previousPage),
        PhoneNumber(nextPage: nextPage, previousPage: previousPage)
      ],
    ));
  }
}
