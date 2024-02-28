import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  late TabController tabController; // Tab controller for managing tabs
  Rx<bool> showFab = true.obs; // Observable boolean for showing the floating action button

  // Initialize the controller
  void init(dynamic state) {
    tabController = TabController(initialIndex: 1, length: 4, vsync: state); // Initialize the tab controller
    tabController.addListener(() { // Add a listener to the tab controller
      if (tabController.index == 1) { // If the current tab index is 1 (Chats tab)
        showFab(true); // Show the floating action button
      } else {
        showFab(false); // Otherwise, hide the floating action button
      }
    });
  }
}
