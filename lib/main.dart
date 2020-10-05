import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp()); /*1*/

class MyApp extends StatelessWidget {
  /*2*/
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random(); /*3*/
    return MaterialApp(
      /*4*/
      title: 'Welcome to Flutter',
      home: Scaffold(
        /*5*/
        appBar: AppBar(
          /*6*/
          title: Text('Grit GYM アプリ'),
        ),
        body: Center(
          /*7*/
          child: Text(wordPair.toString()),
        ),
      ),
    );
  }
}
