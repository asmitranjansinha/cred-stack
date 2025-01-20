import 'package:cred_assignment/constants/api_constant.dart';
import 'package:cred_assignment/controllers/stack_controller.dart';
import 'package:cred_assignment/services/api_service.dart';
import 'package:cred_assignment/views/stack1_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => StackController(ApiService(DioClient()))),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cred Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Stack1View(),
    );
  }
}
