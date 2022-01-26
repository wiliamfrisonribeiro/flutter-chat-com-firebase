import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {
 
  TextComposer(this.sendMessage);

   final Function({String text, XFile imgFile}) sendMessage;

  @override
  State<TextComposer> createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  bool _isComposing = false;
  final TextEditingController _controller = TextEditingController();

  void _reset() {
    _controller.clear();

    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          IconButton(
              onPressed: () async {
                final ImagePicker _picker = ImagePicker();
                final XFile? imgFile =
                    await _picker.pickImage(source: ImageSource.camera);  

                    if(imgFile == null) return;
                    widget.sendMessage(imgFile: imgFile);
              },
              icon: const Icon(Icons.photo_camera)),
          Expanded(
              child: TextField(
            controller: _controller,
            decoration: const InputDecoration.collapsed(
                hintText: "Enviar uma Menssagem"),
            onChanged: (text) {
              setState(() {
                _isComposing = text.isNotEmpty;
              });
            },
            onSubmitted: (text) {
              widget.sendMessage(text: text);
              _reset();
            },
          )),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _isComposing 
                ? () {
                    widget.sendMessage(text:_controller.text);
                    _reset();
                  }
                : null,
          )
        ],
      ),
    );
  }
}
