import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class Heart extends StatelessWidget {
  final double? width;

  const Heart({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/Heart.svg",
      width: width ?? 7.46.w,
      color: Colors.red,
    );
  }
}
