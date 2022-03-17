import 'package:feed/model/tags.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TagButton extends StatelessWidget {
  final Tags tag;
  const TagButton({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3.w),
      decoration: buildDecoration(),
      width: 21.06.w,
      child: Center(
          child: Text(
            tag.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15),
          )),
    );
  }

  BoxDecoration buildDecoration() {
    return BoxDecoration(
      color: const Color.fromRGBO(255, 255, 255, 1),
      borderRadius: BorderRadius.circular(4),
      boxShadow: const [
        BoxShadow(
          offset: Offset(0, 0),
          blurRadius: 1,
          spreadRadius: 1,
          color: Colors.black26,
        ),
      ],
    );
  }
}
