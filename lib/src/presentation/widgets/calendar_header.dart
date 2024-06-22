import 'package:jalali_flutter_datepicker/jalali_flutter_datepicker.dart';

/// ## [CalendarHeaders] Class Documentation
///
/// The [CalendarHeaders] class represents the header row of a calendar widget,
/// displaying the names of days in Jalali.
///
/// ### Constructors:
///
/// - [CalendarHeaders] : Constructs a [CalendarHeaders] widget.
///
/// ### Example usage:
/// ```dart
/// CalendarHeaders(),
/// ```
///
import 'package:flutter/material.dart';

class CalendarHeaders extends StatelessWidget {
  final TextStyle textStyle;

  const CalendarHeaders({
    Key? key,
    this.textStyle = const TextStyle(
      color: Colors.black,
      fontSize: 12,
      overflow: TextOverflow.ellipsis,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Center(child: Text("شنبه", style: textStyle))),
        Expanded(child: Center(child: Text("یک", style: textStyle))),
        Expanded(child: Center(child: Text("دو", style: textStyle))),
        Expanded(child: Center(child: Text("سه", style: textStyle))),
        Expanded(child: Center(child: Text("چهار", style: textStyle))),
        Expanded(child: Center(child: Text("پنج", style: textStyle))),
        Expanded(child: Center(child: Text("جمعه", style: textStyle))),
      ],
    );
  }
}
