import 'package:jalali_flutter_datepicker/jalali_flutter_datepicker.dart';
import 'package:flutter/material.dart';

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
              fontSize: 12,
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