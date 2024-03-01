import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_chat_clone/routes/app_route.dart';
import '../controllers/main_controller.dart';
import '../data/mock_data/dummy_data.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    final mainController = Get.find<MainController>();
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            AppRoute.goToChatDetail(index);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[300]!, // Border color
                  width: 0.5, // Border width
                ),
              ),
            ),
            child: ListTile(
              leading: GestureDetector(
                onTap: () {
                  // Show profile image dialog on tap
                  _showProfileImageDialog(context, mainController.chats[index].key.avatarUrl, index);
                },
                child: Hero(
                  transitionOnUserGestures: true, // Allow hero transition on user gestures
                  tag: 'profile-image-tag-$index', // Unique hero tag for each profile image
                  child: CircleAvatar(
                    foregroundColor: Theme.of(context).primaryColor,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(mainController.chats[index].key.avatarUrl),
                  ),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    users[index].name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat.Hm().format(mainController.chats[index].value.first.time),
                    style: const TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ],
              ),
              subtitle: Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  mainController.chats[index].value.first.message,
                  style: const TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Method to show the profile image dialog
  void _showProfileImageDialog(BuildContext context, String imageUrl, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Hero(
          transitionOnUserGestures: true, // Allow hero transition on user gestures
          tag: 'profile-image-tag$index', // Unique hero tag for each profile image
          child: CircleAvatar(
            foregroundColor: Theme.of(context).primaryColor,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(imageUrl),
          ),
        );
      },
    );
  }
}
