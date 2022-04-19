import 'package:flutter/material.dart';




class GeneralAppBarWidget extends StatelessWidget {
  const GeneralAppBarWidget({Key? key, required this.title, required this.body}) : super(key: key);
  final String title;
  final Widget body;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0,
          title: Center(child: Text(title, style: const TextStyle(fontSize: 30,
              fontWeight: FontWeight.bold, color: Colors.black)))),
      body: body,
    );
  }
}

