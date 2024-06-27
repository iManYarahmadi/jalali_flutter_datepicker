import 'package:jalali_flutter_datepicker/jalali_flutter_datepicker.dart';

// // Ensure the startMonth is within the valid range
// List<MonthModel> monthGenerator(int startMonth) {
//   List<MonthModel> generatedMonths = [];
//
//   // Ensure the startMonth is within the valid range
//   if (startMonth < 1 || startMonth > 12) {
//     throw Exception(
//         'Invalid start month: $startMonth. It should be between 1 and 12.');
//   }
//
//   // Add months from the startMonth to the end of the year
//   for (int month = startMonth; month <= 12; month++) {
//     generatedMonths
//         .add(CalendarConstant.monthList.firstWhere((m) => m.monthId == month));
//   }
//
//   return generatedMonths;
// }
List<MonthModel> monthGenerator(int startMonth, {String language = 'persian'}) {
  List<MonthModel> selectedMonthList;

  if (language == 'dari') {
    selectedMonthList = CalendarConstant.dariMonthList;
  } else {
    selectedMonthList = CalendarConstant.persianMonthList;
  }

  List<MonthModel> generatedMonths = [];

  // Ensure the startMonth is within the valid range
  if (startMonth < 1 || startMonth > 12) {
    throw Exception(
        'Invalid start month: $startMonth. It should be between 1 and 12.');
  }

  // Add months from the startMonth to the end of the year
  for (int month = startMonth; month <= 12; month++) {
    generatedMonths.add(selectedMonthList.firstWhere((m) => m.monthId == month));
  }

  return generatedMonths;
}