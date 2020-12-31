import 'package:flutter/material.dart';
import 'package:flutter_mobile_camera/CameraBuilder.dart';
import 'package:flutter_mobile_camera/flutter_mobile_camera.dart';
import 'package:flutter_profile_avatar/StringTools.dart';

class ProfileAvatar extends StatelessWidget {
  final Function(String) onUpdated;

  final String username;
  final String avatarURL;
  final double size;

  const ProfileAvatar({
    Key key,
    this.size = 20,
    this.username,
    this.avatarURL,
    this.onUpdated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: Colors.grey[700],
                offset: Offset(0, 2),
              )
            ],
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              CircleAvatar(
                radius: size,
                backgroundColor: Theme.of(context).primaryColor,
                backgroundImage:
                    avatarURL != null ? NetworkImage(avatarURL) : null,
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
              ),
              Visibility(
                visible: onUpdated != null,
                child: Positioned(
                  right: 0.0,
                  child: Container(
                    width: size / 1.5,
                    height: size / 1.5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        customBorder: CircleBorder(),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Camera(
                                  onBack: () => Navigator.pop(context),
                                  onSend: onUpdated,
                                  onTakePhoto: (path) => null,
                                ),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: size / 2.8,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
