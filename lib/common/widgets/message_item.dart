import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../theme.dart';

class MessageItem extends StatelessWidget {
  final String content;
  final DateTime timestamp;
  final bool isYou;
  final bool isRead;
  final bool isSent;
  final double fontSize;

  // Constructor for MessageItem
  const MessageItem({
    super.key,
    required this.content,
    required this.timestamp,
    required this.isYou,
    this.isRead = false,
    this.isSent = true,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return _buildMessage();
  }

  // Widget function to build the message item
  Widget _buildMessage() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment:
      isYou ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: Container(
            decoration: BoxDecoration(
              color: isYou ? kPrimaryColor : kDarkTextFieldBgColor,
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            ),
            constraints: const BoxConstraints(
              minWidth: 100.0,
              maxWidth: 280.0,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  constraints: const BoxConstraints(
                    minWidth: 100.0,
                  ),
                  child: Text(
                    content,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      width: 100.0,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            DateFormat('HH:mm').format(timestamp),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          isYou ? _getIcon() : Container()
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Function to get the icon based on message status
  Widget _getIcon() {
    if (!isSent) {
      // If message is not sent yet
      return const Icon(
        Icons.check,
        size: 18.0,
        color: Colors.grey,
      );
    }
    // If message is sent
    return Icon(
      Icons.done_all,
      size: 18.0,
      color: isRead ? Colors.lightBlueAccent : Colors.grey,
    );
  }
}
