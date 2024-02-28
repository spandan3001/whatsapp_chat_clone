import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_chat_clone/common/theme.dart';
import 'package:whatsapp_chat_clone/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const HomeScreen(),
      theme: darkTheme,

    );
  }
}
