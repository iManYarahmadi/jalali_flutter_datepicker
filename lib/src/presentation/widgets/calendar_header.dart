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
class CalendarHeaders extends StatelessWidget {
  const CalendarHeaders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Center(child: Text("شنبه"))),
        Expanded(child: Center(child: Text("یک"))),
        Expanded(child: Center(child: Text("دو"))),
        Expanded(child: Center(child: Text("سه"))),
        Expanded(child: Center(child: Text("چهار"))),
        Expanded(child: Center(child: Text("پنج"))),
        Expanded(child: Center(child: Text("جمعه"))),
      ],
    );
  }
}
