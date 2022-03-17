import 'package:feed/widgets/heart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class IconsRow extends StatefulWidget {
  bool? isDoubleTapped;
  IconsRow({Key? key, this.isDoubleTapped}) : super(key: key);

  @override
  State<IconsRow> createState() => _IconsRowState();
}

class _IconsRowState extends State<IconsRow> {
  late bool isLiked;
  @override
  void initState() {
    isLiked = widget.isDoubleTapped ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.only(left: 12.8.w, right: 12.8.w, top: 1.55.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            "assets/Map.svg",
            width: 7.46.w,
          ),
          SvgPicture.asset(
            "assets/Comment.svg",
            width: 7.46.w,
          ),
          buildHeartIcon(),
          SvgPicture.asset(
            "assets/Share.svg",
            width: 7.46.w,
          ),
        ],
      ),
    );
  }

  buildHeartIcon() {
    return widget.isDoubleTapped == true
        ? buildFullHeart()
        : isLiked
        ? buildFullHeart()
        : buildHeartBorder();
  }

  GestureDetector buildFullHeart() {
    return GestureDetector(
        onTap: () {
          setState(() {
            isLiked = !isLiked;
            widget.isDoubleTapped = false;
          });
        },
        child: const Heart());
  }

  GestureDetector buildHeartBorder() {
    return GestureDetector(
        onTap: () {
          setState(() {
            isLiked = !isLiked;
          });
        },
        child: SvgPicture.asset(
          "assets/Like.svg",
          width: 7.46.w,
        ));
  }
}
