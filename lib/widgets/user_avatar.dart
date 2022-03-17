import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String userAvatarUrl;
  final bool isBottom;
  const UserAvatar(
      {Key? key, required this.userAvatarUrl, required this.isBottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(3),
        decoration: buildDecoration(),
        child: isBottom == true ? buildBottomAvatar() : buildUserAvatar());
  }

  BoxDecoration buildDecoration() {
    return const BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color.fromRGBO(255, 0, 128, 1),
          Color.fromRGBO(255, 0, 64, 1),
        ],
      ),
    );
  }

  CircleAvatar buildBottomAvatar() {
    return const CircleAvatar(
      radius: 28,
      backgroundColor: Colors.pinkAccent,
      child: Text(
        "A",
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }

  CircleAvatar buildUserAvatar() {
    return CircleAvatar(
      radius: 28,
      foregroundImage: NetworkImage(
        userAvatarUrl,
      ),
      backgroundColor: Colors.pinkAccent,
    );
  }
}
