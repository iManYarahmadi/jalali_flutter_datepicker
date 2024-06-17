import 'package:jalali_flutter_datepicker/jalali_flutter_datepicker.dart';

/// ## [getMonthNameFromList] Function Documentation
///
/// The [getMonthNameFromList] function retrieves the name of a month based on the provided month number
/// from a given list of [MonthModel] objects.
///
/// ### Parameters:
///
/// - [monthNumber] (int) : The numeric identifier of the month (1 through 12).
/// - [monthList] (List<MonthModel>) : The list of [MonthModel] objects containing month details.
///
/// ### Returns:
///
/// - (String) : The name of the month corresponding to the provided month number.
///
/// ### Exceptions:
///
/// - Throws an [Exception] if the [monthNumber] is not found in the [monthList].
///
/// ### Example usage:
/// ```dart
/// List<MonthModel> months = CalendarConstant.monthList;
/// String monthName = getMonthNameFromList(1, months); // Returns "فروردین"
/// ```
///
/// ### Implementation:
/// ```dart
/// String getMonthNameFromList(int monthNumber, List<MonthModel> monthList) {
///   final matchingMonth = monthList.firstWhere(
///     (month) => month.monthId == monthNumber,
///     orElse: () => throw Exception('Month ID not found in list'),
///   );
///   return matchingMonth.monthName;
/// }
/// ```
String getMonthNameFromList(int monthNumber, List<MonthModel> monthList) {
  final matchingMonth = monthList.firstWhere(
    (month) => month.monthId == monthNumber,
    orElse: () => throw Exception('Month ID not found in list'),
  );
  return matchingMonth.monthName;
}
