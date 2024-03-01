import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../data/mock_data/dummy_data.dart';
import '../data/models/chat_model.dart';
import '../data/models/user_model.dart';

class MainController extends GetxController {


  // Text controller for the input message
  late final TextEditingController messageController;

  // Tab controller for managing tabs
  late final TabController tabController;

  // Observable boolean for showing the floating action button
  final RxBool showFab = true.obs;

  // List to store chat entries, each associated with a user
  final RxList<MapEntry<User, List<Chat>>> chats = <MapEntry<User, List<Chat>>>[].obs;



  // Initialize the controller
  void init(dynamic state) {
    // Initialize the tab controller
    tabController = TabController(initialIndex: 1, length: 4, vsync: state);

    messageController = TextEditingController();
    // Add a listener to the tab controller

    tabController.addListener(() {
      showFab(tabController.index == 1);
    });

    // Load chat data when the controller is initialized
    getChats();
  }

  // Method to load initial chat data
  void getChats() {
    // Clear existing chat entries
    chats.clear();
    // Iterate through users and add chat entries
    for (var user in users) {
      chats.add(MapEntry(user, [...dummyData]));
    }
  }

  // Method to sort chat messages by time in descending order
  void sortChatsByTimeDescending(int chatIndex) {
    chats[chatIndex].value.sort((a, b) => b.time.compareTo(a.time));
  }
}