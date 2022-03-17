
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserRealNameText extends StatelessWidget {
  final String realName;
  const UserRealNameText({Key? key,required this.realName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Text(
        realName,
        style:const TextStyle(
          fontSize: 18,
          color:Color.fromRGBO(255, 255, 255, 0.8),
          fontWeight: FontWeight.w600,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(0.0, 1.0),
              blurRadius: 8.0,
              color: Color.fromRGBO(0, 0, 0, 0),
            ),
          ],
        ),
      ),
    );
  }
}
