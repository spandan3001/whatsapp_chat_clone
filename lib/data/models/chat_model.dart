
import 'user_model.dart';


class Chat {

  String message;
  DateTime time;
  bool isMe;


  Chat({
    required this.message,
    required this.isMe,
    required this.time,
  });
}
