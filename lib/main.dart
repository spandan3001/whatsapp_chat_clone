import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_chat_clone/common/theme.dart';
import 'package:whatsapp_chat_clone/routes/app_route.dart';
import 'package:whatsapp_chat_clone/views/home_screen.dart';

import 'controllers/main_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the main controller
  final mainController = Get.put(MainController());
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
      initialRoute: AppRoute.homeRoute,
      getPages: AppRoute.getPages,
    );
  }
}
