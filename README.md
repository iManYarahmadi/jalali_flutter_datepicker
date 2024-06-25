<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
  <h1>Jalali Flutter Date Picker</h1>

  <p align="center">
    <img src="https://imgurl.ir/uploads/o58018_2.jpeg" width="300" alt="Jalali Flutter Date Picker - Preview 1" />
    <img src="https://imgurl.ir/uploads/w60242_1.jpeg" width="300" alt="Jalali Flutter Date Picker - Preview 2" />
  </p>

  <p>Jalali Flutter Date Picker is a customizable Jalali (Persian) date picker widget for Flutter. This package allows you to easily integrate a Jalali date picker into your Flutter applications with various customization options, including colors for different date states.</p>

<h2>Features</h2>

  <ul>
    <li>Selectable Date Range: Define a range of selectable dates using `firstDateRange` and `lastDateRange` properties.</li>
    <li>Customizable Colors: Set different colors for enabled, disabled, selected, and today's dates using various properties.</li>
    <li>Year Selection:** Navigate between years using the built-in dropdown menus.</li>
    <li>Dynamic Month & Year:** Months and years are generated dynamically based on the selectable date range.</li>
    <li>Fully Customizable:** Adjust the look and feel of the date picker to match your app's design.</li>
  </ul>

<h2>Installation</h2>

  <p>To use Jalali Flutter Date Picker in your project, add it to your `pubspec.yaml` file:</p>

  <pre>
  dependencies:
    jalali_flutter_datepicker: ^latest_version
  </pre>

  <p>Then, run `flutter pub get` to install the package.</p>

<h2>Usage</h2>

  <p>Import the package in your Flutter code:</p>

  <pre>
  import 'package:jalali_flutter_datepicker/jalali_flutter_datepicker.dart';
  </pre>

<h3>Example</h3>

  <p>This example demonstrates how to use the `JalaliFlutterDatePicker` widget in your application:</p>

  <pre>
  JalaliFlutterDatePicker(
    onDateChanged: (value) {
      // Handle the date change in your application
    },
    initialDate: Jalali(1350, 3, 2), // The initial date displayed
    firstDateRange: Jalali(1340, 3, 1), // Earliest selectable date
    lastDateRange: Jalali(1360, 8, 29), // Latest selectable date
    disabledDayColor: Colors.grey,
    enabledDayColor: Colors.black,
    selectedDayBackground: const Color(0xffFD9404),
    selectedDayColor: Colors.white,
    todayColor: const Color(0xffFD9404),
    footerIconColor: const Color(0xffFD9404),
    footerTextStyle: const TextStyle(color: Color(0xffFD9404), fontSize: 12),
    headerTextStyle: const TextStyle(color: Color(0xffFD9404)),
    customArrowWidget: const Icon(Icons.arrow_upward_sharp),
    selectedMonthTextStyle: const TextStyle(fontSize: 15),
    monthDropDownItemTextStyle:  const TextStyle(fontSize: 14),
    selectedYearTextStyle: const TextStyle(fontSize: 15) ,
    yearsDropDownItemTextStyle:  const TextStyle(fontSize: 14),

  )
  </pre>

<h3>Explanation of Fields</h3>

  <ul>
    <li><code>onDateChanged</code>: A callback function triggered when the user selects a date.</li>
    <li><code>initialDate</code>: The initial date displayed when the date picker opens.</li>
    <li><code>firstDateRange</code>: The earliest selectable date.</li>
    <li><code>lastDateRange</code>: The latest selectable date.</li>
    <li>(Color Properties): Customize the colors for different date states.</li>
    <li><code>footerIconColor</code>, <code>footerTextStyle</code>, <code>headerTextStyle</code>: Style the footer and header text.</li>
  </ul>
</body>
</html>
