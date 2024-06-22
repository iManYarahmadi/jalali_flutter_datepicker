import 'package:jalali_flutter_datepicker/jalali_flutter_datepicker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            JalaliFlutterDatePicker(
              onDateChanged: (value) {},
              initialDate: Jalali(1330, 3, 2),
              firstDateRange: Jalali(1340, 3, 1),
              lastDateRange: Jalali(1360, 8, 29),
              disabledDayColor: Colors.grey,
              enabledDayColor: Colors.black,
              selectedDayBackground: const Color(0xffFD9404),
              selectedDayColor: Colors.white,
              todayColor: const Color(0xffFD9404),
              footerIconColor: const Color(0xffFD9404),
              footerTextStyle:
                  const TextStyle(color: Color(0xffFD9404), fontSize: 12),
              headerTextStyle: const TextStyle(color: Color(0xffFD9404)),
            ),
          ],
        ),
      ),
    );
  }
}
