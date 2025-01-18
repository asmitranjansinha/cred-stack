import 'package:cred_assignment/controllers/stack_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Stack1View extends StatelessWidget {
  const Stack1View({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StackController>(
      builder: (context, controller, child) {
        return Scaffold(
          body: Column(
            children: [],
          ),
        );
      },
    );
  }
}
