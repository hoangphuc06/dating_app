import 'package:flutter/material.dart';

class LikesTab extends StatefulWidget {
  const LikesTab({ Key? key }) : super(key: key);

  @override
  _LikesTabState createState() => _LikesTabState();
}

class _LikesTabState extends State<LikesTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Like"),
    );
  }
}