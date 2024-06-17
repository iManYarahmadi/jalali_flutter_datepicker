import 'package:jalali_flutter_datepicker/jalali_flutter_datepicker.dart';

/// A widget that sets a custom error handler for uncaught Flutter errors.
///
/// The [CustomErrorHandler] widget overrides the default `ErrorWidget.builder`
/// to display a user-friendly error message whenever an uncaught error occurs
/// within the widget tree it wraps. This is particularly useful for handling
/// unexpected errors gracefully in both debug and release modes.
/// Example usage:
///
/// ```dart
///     CustomErrorHandler(
///       child: child(),
///     ),

///
class CustomErrorHandler extends StatelessWidget {
  final Widget child;

  CustomErrorHandler({super.key, required this.child}) {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          'خطا!\n${details.exception}',
          style: const TextStyle(color: Colors.blue),
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
