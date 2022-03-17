import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final String username;

  const ExpandableText({
    Key? key,
    required this.text,
    required this.username,
  })  : assert(text != null),
        super(key: key);

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText> {
  bool _readMore = true;
  void _onTapLink() {
    setState(() => _readMore = !_readMore);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle descriptonStyle = const TextStyle(
        color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400);

    TextStyle usernameTextStyle = const TextStyle(
        fontSize: 15, color: Colors.black, fontWeight: FontWeight.w700);

    TextSpan link = TextSpan(
        text: _readMore ? '...more' : ' less',
        style: const TextStyle(
          color: Color.fromRGBO(200, 200, 212, 1),
        ),
        recognizer: TapGestureRecognizer()..onTap = _onTapLink);

    Widget result = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;
        final text = TextSpan(
          text: widget.text,
          style: descriptonStyle,
        );
        TextPainter textPainter = TextPainter(
          text: link,
          textDirection: TextDirection.rtl,
          maxLines: 3,
          ellipsis: '...',
        );
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final linkSize = textPainter.size;
        textPainter.text = text;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final textSize = textPainter.size;
        int? endIndex;
        final pos = textPainter.getPositionForOffset(Offset(
          textSize.width - linkSize.width,
          textSize.height,
        ));

        endIndex = textPainter.getOffsetBefore(pos.offset);
        var textSpan;

        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(children: [
            TextSpan(text: widget.username + "  ", style: usernameTextStyle),
            TextSpan(
              text:
              _readMore ? widget.text.substring(0, endIndex) : widget.text,
              style: descriptonStyle,
              children: <TextSpan>[link],
            )
          ]);
        } else {
          textSpan = TextSpan(children: [
            TextSpan(
              text: widget.username + "  ",
              style: usernameTextStyle,
            ),
            TextSpan(
              text: widget.text,
              style: descriptonStyle,
              // children: [link]
            ),
          ]);
        }
        return RichText(
          softWrap: true,
          overflow: TextOverflow.clip,
          text: textSpan,
        );
      },
    );
    return Container(
        padding: EdgeInsets.only(top: 2.07.h, left: 3.2.w, right: 3.2.w),
        child: result);
  }
}
