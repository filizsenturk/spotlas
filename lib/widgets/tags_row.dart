import 'package:feed/widgets/tag_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TagsRow extends StatelessWidget {
  final List? tagsList;
  const TagsRow({Key? key, this.tagsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return tagsList != null
        ? Container(
        height: 7.h,
        width: 100.w,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tagsList != null ? tagsList!.length : 1,
            itemBuilder: (context, index) {
              return tagsList != null
                  ? TagButton(tag: tagsList![index])
                  : Container();
            }))
        : Container();
  }
}
