import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class StarWidget extends StatefulWidget {
  const StarWidget({Key? key}) : super(key: key);

  @override
  State<StarWidget> createState() => _StarWidgetState();
}

class _StarWidgetState extends State<StarWidget> {
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSaved = !isSaved;
        });
      },
      child: isSaved == true
          ? SvgPicture.asset("assets/star.svg",
          width: 6.66.w, color: Colors.yellowAccent)
          : SvgPicture.asset(
        "assets/star_border.svg",
        width: 6.66.w,
        color: const Color.fromRGBO(255, 255, 255, 1),
      ),
    );
  }
}
