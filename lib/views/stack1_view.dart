import 'package:cred_assignment/controllers/stack_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Stack1View extends StatelessWidget {
  const Stack1View({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StackController>(
      builder: (context, controller, child) {
        if (controller.isLoading) {
          return SizedBox(
            width: double.infinity,
            child: Lottie.asset(
              "assets/animations/cred-starting-animation.json",
              fit: BoxFit.cover,
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.black12,
            body: Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: Column(
                children: [
                  header(),
                  body(),
                ],
              ),
            ),
            bottomSheet: Container(
              height: 75,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 20, 68, 151),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                controller.stackItems[0].ctaText.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 26, 39, 46),
              borderRadius: BorderRadius.circular(60 / 2),
            ),
            padding: EdgeInsets.all(2.0),
            alignment: Alignment.center,
            child: Icon(
              CupertinoIcons.xmark,
              color: Colors.white70,
              size: 18,
            ),
          ),
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 26, 39, 46),
              borderRadius: BorderRadius.circular(60 / 2),
            ),
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: Icon(
              CupertinoIcons.question,
              color: Colors.white70,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget body() {
    return Container();
  }
}
