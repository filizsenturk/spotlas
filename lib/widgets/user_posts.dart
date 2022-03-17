import 'package:feed/widgets/created_time_widget.dart';
import 'package:feed/widgets/expandable_text.dart';
import 'package:feed/widgets/icons_row.dart';
import 'package:feed/widgets/tags_row.dart';
import 'package:feed/widgets/user_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserPost extends StatefulWidget {
  final String imageUrl;
  final String userAvatarUrl;
  final String username;
  final String realName;
  final String placeName;
  final String location;
  final String description;
  final List? tagsList;
  final DateTime time;

  const UserPost(
      {Key? key,
        required this.userAvatarUrl,
        required this.imageUrl,
        required this.username,
        required this.realName,
        required this.placeName,
        required this.location,
        required this.description,
        this.tagsList,
        required this.time})
      : super(key: key);
  @override
  State<UserPost> createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> {
  bool isDoubleTapped = false;
  bool? liked;

  onDoubleTapped() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isDoubleTapped = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 7.53.h),
      color: Colors.white,
      width: 100.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildPublishedPhoto(),
          IconsRow(
            isDoubleTapped: liked,
          ),
          ExpandableText(
            text: widget.description,
            username: widget.username,
          ),
          TagsRow(tagsList: widget.tagsList),
          CreatedTimeWidget(
            time: widget.time,
          )
        ],
      ),
    );
  }

  GestureDetector buildPublishedPhoto() {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          isDoubleTapped = true;
          liked = true;
        });
        onDoubleTapped();
      },
      child: UserImage(
        imageUrl: widget.imageUrl,
        userAvatarUrl: widget.userAvatarUrl,
        username: widget.username,
        realName: widget.realName,
        placeName: widget.placeName,
        location: widget.location,
        isDoubleTapped: isDoubleTapped,
      ),
    );
  }
}
