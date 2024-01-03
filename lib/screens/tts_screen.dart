import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TtsScreen extends StatefulWidget {
  @override
  _TtsScreenState createState() => _TtsScreenState();
}

class _TtsScreenState extends State<TtsScreen> {
  FlutterTts flutterTts = FlutterTts();
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text-to-Speech'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: textController,
                maxLines: null, // Allow multiline input
                expands: true, // Expand the text field to fill the available space
                textAlignVertical: TextAlignVertical.top, // Align text to the top
                decoration: InputDecoration(
                  labelText: 'Enter Text to Speak',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _speak();
            },
            child: Text('Speak'),
          ),
        ],
      ),
    );
  }

  Future<void> _speak() async {
    String textToSpeak = textController.text.trim();

    if (textToSpeak.isNotEmpty) {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1.0);
      await flutterTts.setSpeechRate(0.5);
      await flutterTts.speak(textToSpeak);
    } else {
      // Show a message or alert that the text field is empty.
      // You can customize this part based on your app's requirements.
      print("Text field is empty!");
    }
  }
}
