# flutter_profile_avatar

Allows you to create an avatar simply...

## Getting Started

```
import 'package:flutter/material.dart';
import 'package:flutter_profile_avatar/flutter_profile_avatar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(
          child: ProfileAvatar(
            // Set username (create initial in avatar)
            username: 'John Doe',
            // Set image profile
            avatarURL: 'https://picsum.photos/200',
            // Set size of avatar
            size: 30,
          ),
        ),
      ),
    );
  }
}

```