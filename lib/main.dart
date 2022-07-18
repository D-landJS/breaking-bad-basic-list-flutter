import 'package:breaking_bad_character_list_app/screens/character_list.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const CharacterList(),
    );
  }
}
