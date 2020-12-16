import 'package:flutter/material.dart';
import 'package:flutter_profile_avatar/flutter_profile_avatar.dart';
import 'package:flutter_mobile_camera/CameraBuilder.dart';

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
    return CameraBuilder(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Center(
            child: Container(
              child: ProfileAvatar(
                // Set username (create initial in avatar)
                username: 'John Doe',
                // Set image profile
                avatarURL: 'https://picsum.photos/200',
                // Set size of avatar
                size: 70,
                // Allows to change the photo if the onUpdate method is defined.
                onUpdated: (value) => print(value),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
