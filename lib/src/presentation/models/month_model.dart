/// ## [MonthModel] Class Documentation
///
/// The [MonthModel] class represents a month in the Jalali calendar with an ID and a name.
///
/// ### Properties:
///
/// - [monthId] (int) : The numeric identifier of the month (1 through 12).
/// - [monthName] (String) : The name of the month.
///
/// ### Constructors:
///
/// - [MonthModel] : Creates a [MonthModel] instance with the required month ID and month name.
///
/// ### Example usage:
/// ```dart
/// MonthModel farvardin = MonthModel(monthId: 1, monthName: "فروردین");
/// ```
///
/// ### Implementation:
/// ```dart
class MonthModel {
  final int monthId;
  final String monthName;

  MonthModel({required this.monthId, required this.monthName});
}
