import 'package:flutter/material.dart';
import 'package:flutter_profile_avatar/StringTools.dart';

class ProfileAvatar extends StatelessWidget {
  final String username;
  final String avatarURL;
  final double size;

  const ProfileAvatar({
    Key key,
    this.size = 20,
    this.username,
    this.avatarURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundColor: Theme.of(context).primaryColor,
      backgroundImage: avatarURL != null ? NetworkImage(avatarURL) : null,
      child: avatarURL == null
          ? username != null
              ? Text(
                  username.initial(),
                  style: TextStyle(
                    fontSize: size / 1.3,
                  ),
                )
              : null
          : null,
    );
  }
}
