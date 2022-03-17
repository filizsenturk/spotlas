import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CreatedTimeWidget extends StatefulWidget {
  DateTime time;
  CreatedTimeWidget({Key? key, required this.time}) : super(key: key);

  @override
  State<CreatedTimeWidget> createState() => _CreatedTimeWidgetState();
}

class _CreatedTimeWidgetState extends State<CreatedTimeWidget> {
  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours).round();
  }

  int? week;
  int? year;
  int? day;
  int? hour;
  int? month;

  @override
  Widget build(BuildContext context) {
    int passedHours = daysBetween(widget.time, DateTime.now());
    int passedDay = (daysBetween(widget.time, DateTime.now()) / 24).round();
    if (passedHours < 24) {
      setState(() {
        hour = passedHours;
      });
    } else if (passedDay < 7) {
      setState(() {
        day = passedDay;
      });
    } else if (passedDay < 31) {
      setState(() {
        week = (passedDay/7).round();
      });
    }
    else if (passedDay < 365) {
      setState(() {
        month = (passedDay / 30).round();
      });
    } else {
      setState(() {
        year = (passedDay / 365).round();
      });
    }
    return Container(
      padding: EdgeInsets.only(left: 3.w),
      child: Text(
        hour != null
            ? hour == 1
            ? "$hour hour ago"
            : "$hour hours ago"
            : day != null
            ? day == 1
            ? "$day day ago"
            : "$day days ago"
            : week != null
            ? week == 1
            ? "$week week ago"
            : "$week weeks ago"
            : month != null
            ? month == 1
            ? "$month month ago"
            : "$month months ago"
            : year == 1
            ? "$year year ago"
            : "$year years ago",
        style: const TextStyle(
            color: Color.fromRGBO(232, 232, 240, 1), fontSize: 15),
      ),
    );
  }
}
