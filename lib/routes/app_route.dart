import 'package:get/get.dart';

import '../views/chat_detail_screen.dart';
import '../views/chat_screen.dart';
import '../views/home_screen.dart';

class AppRoute {
  // Define route names as constants
  static const String homeRoute = '/';
  static const String chatRoute = '/chat';
  static const String chatDetailRoute = '/chatDetail';

  // Define a list of GetPages for navigation
  static List<GetPage> getPages = [
    GetPage(name: homeRoute, page: () => const HomeScreen()), // Home Screen
    GetPage(name: chatRoute, page: () => const ChatScreen()), // Chat Screen
    GetPage(
        name: chatDetailRoute,
        page: () => const ChatDetailScreen()), // Chat Detail Screen
  ];

  // Method to navigate to the home screen
  static void goToHome() {
    Get.offAllNamed(homeRoute);
  }

  // Method to navigate to the chat screen
  static void goToChat() {
    Get.toNamed(chatRoute);
  }

  // Method to navigate to the chat detail screen with a specific chat index as argument
  static void goToChatDetail(int chatIndex) {
    Get.toNamed(chatDetailRoute, arguments: chatIndex);
  }
}
