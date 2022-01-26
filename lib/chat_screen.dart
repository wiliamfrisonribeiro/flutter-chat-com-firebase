import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/text_composer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart'  as firebase_storage;
import 'dart:io' as io;

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

void _sendMesssage({String? text, XFile? imgFile}){

  if(imgFile !=null){

      firebase_storage.UploadTask task = firebase_storage.FirebaseStorage.instance.ref().child(

        DateTime.now().microsecondsSinceEpoch.toString()
      ).putFile(io.File(imgFile.path));
  }
  FirebaseFirestore.instance.collection('menssagens').add({
    'text': text
}
  );


}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Olá"),
        elevation: 0,
      ),
      body: TextComposer(_sendMesssage),
    );
  }
}
