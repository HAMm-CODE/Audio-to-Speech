import 'package:flutter/material.dart';
import 'package:texttospeech_andspeechtotext/screens/Myhome_page.dart';
import 'package:texttospeech_andspeechtotext/screens/speechtotext.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

