import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_chat_clone/controllers/main_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late MainController mainController;

  @override
  void initState() {
    super.initState();
    // Initialize the main controller
    mainController = Get.put(MainController());
    // Initialize the controller state
    mainController.init(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WhatsApp"),
        elevation: 0.7,
        bottom: TabBar(
          controller: mainController.tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: "CHATS"),
            Tab(text: "STATUS"),
            Tab(text: "CALLS"),
          ],
        ),
        actions: const [
          Icon(Icons.search),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
          ),
          Icon(Icons.more_vert)
        ],
      ),
      body: TabBarView(
        controller: mainController.tabController,
        children: const [],
      ),
      // Show or hide the FAB based on controller state
      floatingActionButton: Obx(
        () => mainController.showFab.value
            ? FloatingActionButton(
                backgroundColor: Colors.green,
                child: const Icon(
                  Icons.message,
                  color: Colors.white,
                ),
                onPressed: () => {},
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
