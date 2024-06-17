import 'package:jalali_flutter_datepicker/jalali_flutter_datepicker.dart';

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: JalaliHomePage(),
    );
  }
}

class JalaliHomePage extends StatelessWidget {
  const JalaliHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              JalaliFlutterDatePicker(
                onDateChanged: (value) {},
                initialDate: Jalali(1350, 3, 2),
                firstDateRange: Jalali(1340, 3, 1),
                lastDateRange: Jalali(1360, 12, 29),
                disabledDayColor: Colors.red,

              ),
            ],
          ),
        ),
      ),
    );
  }
}
