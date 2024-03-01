// Import necessary packages and files
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_chat_clone/common/widgets/message_item.dart';
import 'package:whatsapp_chat_clone/controllers/main_controller.dart';
import 'package:whatsapp_chat_clone/data/models/chat_model.dart';
import '../common/widgets/input_field.dart';

// Enum for menu options in the chat detail screen
enum ChatDetailMenuOptions {
  viewContact,
  media,
  search,
  muteNotifications,
  wallpaper,
  more,
}

// Chat detail screen widget
class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the main controller
    final mainController = Get.find<MainController>();
    // Extract the chat index argument from navigation
    final chatIndex = Get.arguments as int;

    return Scaffold(
      appBar: AppBar(
        // App bar content
        leading: IconButton(
          onPressed: () {
            Get.back(); // Navigate back when back button is pressed
          },
          icon: const Icon(Icons.arrow_back),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              // Display contact avatar
              backgroundImage: NetworkImage(mainController.chats[chatIndex].key.avatarUrl),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display contact name
                Text(mainController.chats[chatIndex].key.name),
                const Text(
                  "online", // Placeholder for online status
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          // Action buttons in app bar
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.videocam),
                onPressed: () {
                  // Action to perform when video call button is pressed
                },
              );
            },
          ),
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.call),
                onPressed: () {
                  // Action to perform when voice call button is pressed
                },
              );
            },
          ),
          PopupMenuButton<ChatDetailMenuOptions>(
            // Popup menu for additional options
            tooltip: "More options",
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<ChatDetailMenuOptions>(
                  value: ChatDetailMenuOptions.viewContact,
                  child: Text("View contact"),
                ),
                const PopupMenuItem<ChatDetailMenuOptions>(
                  value: ChatDetailMenuOptions.media,
                  child: Text("Media"),
                ),
                const PopupMenuItem<ChatDetailMenuOptions>(
                  value: ChatDetailMenuOptions.search,
                  child: Text("Search"),
                ),
                const PopupMenuItem<ChatDetailMenuOptions>(
                  value: ChatDetailMenuOptions.muteNotifications,
                  child: Text("Mute notifications"),
                ),
                const PopupMenuItem<ChatDetailMenuOptions>(
                  value: ChatDetailMenuOptions.wallpaper,
                  child: Text("Wallpaper"),
                ),
                const PopupMenuItem<ChatDetailMenuOptions>(
                  value: ChatDetailMenuOptions.more,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(0.0),
                    title: Text("More"),
                    trailing: Icon(Icons.arrow_right),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background image container
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/doodle_bg.png'), // Provide your image asset path here
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Obx(
                      () => ListView.builder(
                    reverse: true,
                    itemCount: mainController.chats[chatIndex].value.length,
                    itemBuilder: (context, index) {
                      // Sort chats by time in descending order
                      mainController.sortChatsByTimeDescending(chatIndex);
                      // Get chat data
                      final chat = mainController.chats[chatIndex].value[index];

                      // Display chat message
                      return Column(
                        children: [
                          MessageItem(
                            content: chat.message,
                            timestamp: chat.time,
                            isYou: chat.isMe,
                            fontSize: 16,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              // Input message field
              InputMessage(
                controller: mainController.messageController,
                onPressed: () {
                  // Action to perform when send button is pressed
                  if (mainController.messageController.text.trim().isNotEmpty) {
                    // Add new chat message to the chat list
                    mainController.chats[chatIndex].value.add(Chat(
                      message: mainController.messageController.text,
                      isMe: true,
                      time: DateTime.now(),
                    ));
                    // Refresh the chat list to reflect changes
                    mainController.chats.refresh();
                  }
                  // Clear input field after sending message
                  mainController.messageController.clear();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
