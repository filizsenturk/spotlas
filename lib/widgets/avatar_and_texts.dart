
import 'package:feed/widgets/options_widget.dart';
import 'package:feed/widgets/star_widget.dart';
import 'package:feed/widgets/user_avatar.dart';
import 'package:feed/widgets/user_name_text.dart';
import 'package:feed/widgets/user_real_name_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AvatarAndTexts extends StatelessWidget {
  final String avatar;
  final String topText;
  final String bottomText;
  final bool isBottom;
  const AvatarAndTexts({
    Key? key,
    required this.avatar,
    required this.topText,
    required this.bottomText,
    required this.isBottom
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 3.2.w,right: 6.4.w),
      width: 100.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildLeading(),
          buildIcon(),
        ],
      ),
    );
  }

  Expanded buildTextColumn() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 3.33.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:MainAxisAlignment.start ,
          children: [
            UserNameText(username: topText),
            UserRealNameText(realName: bottomText)
          ],
        ),
      ),);
  }

  Container buildLeading() {
    return Container(
      width: 65.w,
      child: Row(
        children: [
          UserAvatar(userAvatarUrl: avatar,isBottom: isBottom,),
          buildTextColumn(),
        ],
      ),
    );
  }

  buildIcon() {
    return isBottom==true ? StarWidget() : OptionsWidget();
  }
}
