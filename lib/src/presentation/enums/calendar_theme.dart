import 'dart:ui';

/// ## [CalendarTheme] Enum Documentation
///
/// The [CalendarTheme] enum represents predefined themes for a calendar,
/// each associated with a specific color.
///
/// ### Usage:
///
/// The [CalendarTheme] enum is used to define the theme color for calendar widgets.
/// Each enum value has a `color` property that can be used to style the calendar.
///
/// ### Enum Values:
///
/// - [insuranceCalendarColor] : The default calendar color, set to a shade of green (`Color(0xff42A670)`).
///
/// ### Properties:
///
/// - [color] : The color associated with the theme.
///
/// ### Example usage:
/// ```dart
/// CalendarTheme theme = CalendarTheme.insuranceCalendarColor;
/// Color themeColor = theme.color;
/// ```
///
/// ### Constructors:
///
/// - [CalendarTheme] : Creates a `CalendarTheme` instance with a specified color.
enum CalendarTheme {
  insuranceCalendarColor(
    Color(0xff42A670),
  ); // پیش فرض

  /// Creates a `CalendarThemeColor` instance with color.
  const CalendarTheme(this.color);

  /// color
  final Color color;
}
