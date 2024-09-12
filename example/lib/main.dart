import 'package:jalali_flutter_datepicker/jalali_flutter_datepicker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        fontFamily:'iransans',
      ),
      debugShowCheckedModeBanner: false,
      home: JalaliHomePage(),
    );
  }
}

class JalaliHomePage extends StatelessWidget {
  const JalaliHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: JalaliFlutterDatePicker(
        onDateChanged: (value) {},
        // language: "dari",
        initialDate: Jalali(1350, 5, 2),
        firstDateRange: Jalali(1340, 3, 1),
        lastDateRange: Jalali(1360, 8, 29),
        disabledDayColor: Colors.grey,
        enabledDayColor: Colors.black,
        selectedDayBackground: const Color(0xffFD9404),
        selectedDayColor: Colors.white,
        todayColor: const Color(0xffFD9404),
        footerIconColor: const Color(0xffFD9404),
        footerTextStyle:
            const TextStyle(color: Color(0xffFD9404), fontSize: 15),
        headerTextStyle: const TextStyle(color: Color(0xffFD9404)),
        selectedMonthTextStyle: const TextStyle(fontSize: 15),
        monthDropDownItemTextStyle:  const TextStyle(fontSize: 14),
        selectedYearTextStyle: const TextStyle(fontSize: 15) ,
        yearsDropDownItemTextStyle:  const TextStyle(fontSize: 14),
      ),
    );
  }
}
