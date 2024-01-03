import 'package:flutter/material.dart';
import 'package:texttospeech_andspeechtotext/screens/contactUs.dart';

import 'speechtotext.dart';
import 'tts_screen.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Mukasa Devices'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(onPressed: () {
              Navigator.push(
                  context,
              MaterialPageRoute(builder: (context)=> ContactUs())); }, icon:Icon(Icons.question_mark, color: Colors.green, size: 40,)),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TtsScreen()),
                );
              },
              child: Text('Text-to-Speech'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SpeechToText()),
                );
              },
              child: Text('Speech-to-Text'),
            ),
          ],
        ),
      ),
      );
    
  }
}