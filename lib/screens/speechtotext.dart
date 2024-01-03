import 'package:avatar_glow/avatar_glow.dart';
import 'package:clipboard/clipboard.dart';
// import 'package:super_clipboard/super_clipboard.dart';
import 'package:flutter/material.dart';

import '../api/speech_api.dart';
import '../utils.dart';
import '../widget/substring_highlighted.dart';

class SpeechToText extends StatefulWidget {
  @override
  _SpeechToTextState createState() => _SpeechToTextState();
}

class _SpeechToTextState extends State<SpeechToText> {

  String text = 'Press the button and start speaking';
  bool isListening = false;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text("Mukasa enterprises"),
      centerTitle: true,
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.content_copy),
            onPressed: () async {
              await FlutterClipboard.copy(text);
              //
              ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('✓   Copied to Clipboard')));
                  }

          ),
        ),
      ],
    ),
    body: SingleChildScrollView(
      reverse: true,
      padding: const EdgeInsets.all(30).copyWith(bottom: 150),
      child: SubstringHighlight(
        text: text,
        terms: Command.all,
        textStyle: TextStyle(
          fontSize: 32.0,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        textStyleHighlight: TextStyle(
          fontSize: 32.0,
          color: Colors.red,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: AvatarGlow(
      animate: isListening,

      glowColor: Theme.of(context).primaryColor,
      child: FloatingActionButton(
        child: Icon(isListening ? Icons.mic : Icons.mic_none, size: 36),
        onPressed: toggleRecording,
      ),
    ),
  );

  Future toggleRecording() => SpeechApi.toggleRecording(
    onResult: (text) => setState(() => this.text = text),
    onListening: (isListening) {
      setState(() => this.isListening = isListening);

      if (!isListening) {
        Future.delayed(Duration(seconds: 1), () {
          Utils.scanText(text);
        });
      }
    },

  );
}