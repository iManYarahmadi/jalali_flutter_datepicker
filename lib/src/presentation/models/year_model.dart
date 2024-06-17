/// ## [YearModel] Class Documentation
///
/// The [YearModel] class represents a year in the Jalali calendar with an ID and a name.
///
/// ### Properties:
///
/// - [yearId] (int) : The numeric identifier of the year.
/// - [yearName] (int) : The name of the year, which in this case is the same as the year ID.
///
/// ### Constructors:
///
/// - [YearModel] : Creates a [YearModel] instance with the required year ID and year name.
///
/// ### Example usage:
/// ```dart
/// YearModel year1400 = YearModel(yearId: 1400, yearName: 1400);
/// ```
///
/// ### Implementation:
/// ```dart
/// class YearModel {
///   final int yearId;
///   final int yearName;
///
///   YearModel({required this.yearId, required this.yearName});
/// }
/// ```
class YearModel {
  final int yearId;
  final int yearName;

  YearModel({required this.yearId, required this.yearName});
}
