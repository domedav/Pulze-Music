import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    final devicePadding = MediaQuery.of(context).padding;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: devicePadding.left, right: devicePadding.right, top: devicePadding.top),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}