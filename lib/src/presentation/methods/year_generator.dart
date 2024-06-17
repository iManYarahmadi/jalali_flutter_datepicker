import 'package:jalali_flutter_datepicker/jalali_flutter_datepicker.dart';

/// ## [yearGenerator] Function Documentation
///
/// The [yearGenerator] function generates a list of [YearModel] objects for a specified range of years.
///
/// ### Parameters:
///
/// - [startYear] (int) : The starting year of the range.
/// - [endYear] (int) : The ending year of the range.
///
/// ### Returns:
///
/// - (List<YearModel>) : A list of [YearModel] objects representing the years from [startYear] to [endYear].
///
/// ### Example usage:
/// ```dart
/// List<YearModel> years = yearGenerate(1330, 1400);
/// // Returns a list of YearModel objects from the year 1330 to 1400
/// ```
///
/// ### Implementation:
/// ```dart
/// List<YearModel> yearGenerate(int startYear, int endYear) {
///   List<YearModel> yearsList = [];
///
///   // Add years from startYear to endYear
///   for (int year = startYear; year <= endYear; year++) {
///     yearsList.add(YearModel(yearId: year, yearName: year));
///   }
///
///   return yearsList;
/// }
/// ```
List<YearModel> yearGenerator(int startYear, int endYear) {
  List<YearModel> yearsList = [];

  // Add years from 1330 to the current year
  for (int year = startYear; year <= endYear; year++) {
    yearsList.add(YearModel(yearId: year, yearName: year));
  }

  return yearsList;
}
