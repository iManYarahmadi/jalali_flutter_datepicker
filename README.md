<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
  <h1>Jalali Flutter Date Picker</h1>

  <p align="center">
    <img src="https://github.com/user-attachments/assets/f976bf0a-bab4-4e21-bfb7-235b15029240" width="300" alt="Jalali Flutter Date Picker - Preview 1" />
    <img src="https://github.com/user-attachments/assets/40312af8-d0a2-4db4-879a-45a2e4c2a73d" width="300" alt="Jalali Flutter Date Picker - Preview 2" />
  </p>

  <p>Jalali Flutter Date Picker is a customizable Jalali (Persian) date picker widget for Flutter. This package allows you to easily integrate a Jalali date picker into your Flutter applications with various customization options, including colors for different date states.(Supporting Dari Language)</p>

<h2>Features</h2>

  <ul>
    <li>Selectable Date Range: Define a range of selectable dates using `firstDateRange` and `lastDateRange` properties.</li>
    <li>Customizable Colors: Set different colors for enabled, disabled, selected, and today's dates using various properties.</li>
    <li>Year Selection: Navigate between years using the built-in dropdown menus.</li>
    <li>Dynamic Month & Year: Months and years are generated dynamically based on the selectable date range.</li>
    <li>Fully Customizable: Adjust the look and feel of the date picker to match your app's design.</li>
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
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'iransans',
        primaryColor: const Color(0xff007AFF), // Using a modern blue color
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black87),
          bodyMedium: TextStyle(color: Colors.black54),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const JalaliHomePage(),
    );
  }
}

class JalaliHomePage extends StatelessWidget {
  const JalaliHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white, // Light grayish background
      appBar: AppBar(
        title: const Text(
          'Jalali Flutter Date Picker',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xffFF6D00), // Vibrant orange for the AppBar
        elevation: 5,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: JalaliFlutterDatePicker(
            onDateChanged: (value) {
            },
            // language: "dari",
            initialDate: Jalali(1350, 5, 2),
            firstDateRange: Jalali(1340, 3, 1),
            lastDateRange: Jalali(1360, 8, 29),
            disabledDayColor: Colors.grey.shade300,
            enabledDayColor: Colors.black,
            selectedDayBackground: const Color(0xffFF6D00), // Orange for selected day
            selectedDayColor: Colors.white,
            todayColor: const Color(0xffFFA726), // Softer orange for today
            footerIconColor: const Color(0xffFF6D00), // Orange icons
            footerTextStyle: const TextStyle(
              color: Color(0xffFF6D00),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            headerTextStyle: const TextStyle(
              color: Color(0xffFF6D00),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            selectedMonthTextStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            monthDropDownItemTextStyle: const TextStyle(
              fontSize: 15,
              color: Colors.black54,
            ),
            selectedYearTextStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            yearsDropDownItemTextStyle: const TextStyle(
              fontSize: 15,
              color: Colors.black54,
            ),
            customArrowWidget: const Icon(
              Icons.arrow_drop_down,
              size: 30,
              color: Color(0xffFF6D00), // Orange arrow for dropdown
            ),
          ),
        ),
      ),
    );
  }
}

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
