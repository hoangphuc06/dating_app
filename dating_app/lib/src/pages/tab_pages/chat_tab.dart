import 'package:flutter/material.dart';

class ChatTab extends StatefulWidget {
  const ChatTab({ Key? key }) : super(key: key);

  @override
  _ChatTabState createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Chat"),
    );
  }
}