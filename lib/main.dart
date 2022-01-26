import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'chat_screen.dart';

void main() async {
  runApp(const MyApp());
   Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat Flutter",
      theme: ThemeData(primarySwatch: Colors.deepPurple, iconTheme: IconThemeData(color: Colors.deepPurple)),
      home: ChatScreen(),
    );
  }
}
