import 'package:whatsapp_chat_clone/data/models/user_model.dart';

import '../models/chat_model.dart';

final User currentUser = User(
    name: "Alice",
    avatarUrl:
        "https://imgs.search.brave.com/qp19jzXKVPn-a-nTiJIU2wnkcOWcpG3Gwi0KnrVOJYU/rs:fit:500:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAyLzg2LzQ3LzA5/LzM2MF9GXzI4NjQ3/MDk2NV92aWFITTZa/TmpyY3ZMRU5lMTR5/V1FGaTFqRW0yaktl/Vi5qcGc");

List<User> users = [
  User(
      name: "Bob",
      avatarUrl:
          "https://imgs.search.brave.com/qp19jzXKVPn-a-nTiJIU2wnkcOWcpG3Gwi0KnrVOJYU/rs:fit:500:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAyLzg2LzQ3LzA5/LzM2MF9GXzI4NjQ3/MDk2NV92aWFITTZa/TmpyY3ZMRU5lMTR5/V1FGaTFqRW0yaktl/Vi5qcGc"),
  User(
    name: "Charlie",
    avatarUrl:
        "https://imgs.search.brave.com/qp19jzXKVPn-a-nTiJIU2wnkcOWcpG3Gwi0KnrVOJYU/rs:fit:500:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAyLzg2LzQ3LzA5/LzM2MF9GXzI4NjQ3/MDk2NV92aWFITTZa/TmpyY3ZMRU5lMTR5/V1FGaTFqRW0yaktl/Vi5qcGc",
  ),
  User(
      name: "David",
      avatarUrl:
          "https://imgs.search.brave.com/qp19jzXKVPn-a-nTiJIU2wnkcOWcpG3Gwi0KnrVOJYU/rs:fit:500:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAyLzg2LzQ3LzA5/LzM2MF9GXzI4NjQ3/MDk2NV92aWFITTZa/TmpyY3ZMRU5lMTR5/V1FGaTFqRW0yaktl/Vi5qcGc"),
  User(
      name: "Eve",
      avatarUrl:
          "https://imgs.search.brave.com/qp19jzXKVPn-a-nTiJIU2wnkcOWcpG3Gwi0KnrVOJYU/rs:fit:500:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAyLzg2LzQ3LzA5/LzM2MF9GXzI4NjQ3/MDk2NV92aWFITTZa/TmpyY3ZMRU5lMTR5/V1FGaTFqRW0yaktl/Vi5qcGc"),
  User(
      name: "Frank",
      avatarUrl:
          "https://imgs.search.brave.com/qp19jzXKVPn-a-nTiJIU2wnkcOWcpG3Gwi0KnrVOJYU/rs:fit:500:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAyLzg2LzQ3LzA5/LzM2MF9GXzI4NjQ3/MDk2NV92aWFITTZa/TmpyY3ZMRU5lMTR5/V1FGaTFqRW0yaktl/Vi5qcGc"),
];

List<Chat> dummyData = [
  Chat(message: "Hey Flutter, You are so amazing !", time: DateTime(2024, 2, 25, 15, 30), isMe: false),
  Chat(message: "Hey I have hacked whatsapp!", time: DateTime(2024, 2, 25, 17, 30), isMe: false),
  Chat(message: "Wassup !", time: DateTime(2024, 2, 25, 5, 0), isMe: false),
  Chat(message: "I'm good!", time: DateTime(2024, 2, 25, 10, 30), isMe: false),
  Chat(message: "I'm the fastest man alive!", time: DateTime(2024, 2, 25, 12, 30), isMe: false),
  Chat(message: "Hey Flutter, You are so cool !", time: DateTime(2024, 2, 25, 15, 30), isMe: false),
];

