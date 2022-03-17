import 'package:feed/widgets/avatar_and_texts.dart';
import 'package:feed/widgets/heart.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserImage extends StatefulWidget {
  final String imageUrl;
  final String userAvatarUrl;
  final String username;
  final String realName;
  final String placeName;
  final String location;
  bool isDoubleTapped;

  UserImage({
    Key? key,
    required this.imageUrl,
    required this.userAvatarUrl,
    required this.username,
    required this.realName,
    required this.placeName,
    required this.location,
    required this.isDoubleTapped,
  }) : super(key: key);

  @override
  State<UserImage> createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      child: Stack(
        children: [
          Image.network(
            widget.imageUrl,
            width: 100.w,
          ),
          buildAvatarAndName(),
          buildPlaceTexts(),
          buildCenter(),
        ],
      ),
    );
  }

  Positioned buildAvatarAndName() {
    return Positioned(
        top: 10,
        child: AvatarAndTexts(
          topText: widget.username,
          avatar: widget.userAvatarUrl,
          bottomText: widget.realName,
          isBottom: false,
        ));
  }

  Positioned buildPlaceTexts() {
    return Positioned(
        bottom: 1.81.h,
        child: AvatarAndTexts(
          topText: widget.placeName,
          bottomText: widget.location,
          avatar: widget.userAvatarUrl,
          isBottom: true,
        ));
  }

  Container buildCenter() {
    return Container(
      padding: EdgeInsets.only(
        top: 30.h,
      ),
      alignment: Alignment.center,
      child: widget.isDoubleTapped == true
          ? Heart(
        width: 15.w,
      )
          : Container(),
    );
  }
}
