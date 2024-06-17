import 'package:jalali_flutter_datepicker/jalali_flutter_datepicker.dart';

/// ## [CalendarConstant] Class Documentation
///
/// The [CalendarConstant] class provides a constant list of months for the Jalali calendar.
/// This class cannot be instantiated and only serves to hold static constants.
///
/// ### Properties:
///
/// - [monthList] : A static list of [MonthModel] objects representing the months in the Jalali calendar.
///
/// ### Example usage:
/// ```dart
/// List<MonthModel> months = CalendarConstant.monthList;
/// ```
class CalendarConstant {
  CalendarConstant._();
  static List<MonthModel> monthList = [
    MonthModel(monthId: 1, monthName: "فروردین"),
    MonthModel(monthId: 2, monthName: "اردیبهشت"),
    MonthModel(monthId: 3, monthName: "خرداد"),
    MonthModel(monthId: 4, monthName: "تیر"),
    MonthModel(monthId: 5, monthName: "مرداد"),
    MonthModel(monthId: 6, monthName: "شهریور"),
    MonthModel(monthId: 7, monthName: "مهر"),
    MonthModel(monthId: 8, monthName: "آبان"),
    MonthModel(monthId: 9, monthName: "آذر"),
    MonthModel(monthId: 10, monthName: "دی"),
    MonthModel(monthId: 11, monthName: "بهمن"),
    MonthModel(monthId: 12, monthName: "اسفند"),
  ];
}
