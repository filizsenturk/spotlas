import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class OptionsWidget extends StatelessWidget {
  const OptionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/options.svg",
      width: 6.66.w,
    );
  }
}
