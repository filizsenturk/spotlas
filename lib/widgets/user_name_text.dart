import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserNameText extends StatelessWidget {
  final String username;
  const UserNameText({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      username,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.white,
        shadows: <Shadow>[
          Shadow(
            offset: Offset(0.0, 1.0),
            blurRadius: 8.0,
            color: Color.fromRGBO(0, 0, 0, 0.8),
          ),
        ],
      ),
    );
  }
}
