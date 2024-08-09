import 'package:flutter/cupertino.dart';
import 'package:jalali_flutter_datepicker/jalali_flutter_datepicker.dart';
import 'package:jalali_flutter_datepicker/src/presentation/methods/month_generator.dart';

///
/// The [JalaliFlutterDatePicker] class represents a widget for displaying a customizable Jalali calendar.
///
/// ### Usage:
///
/// The [JalaliFlutterDatePicker] class is used to display a calendar that allows users to select dates within a specified range,
/// and handles errors gracefully using a custom error handler.
///
/// ### Constructors:
///
/// - [JalaliFlutterDatePicker] : Constructs a [JalaliFlutterDatePicker] with required parameters for initial date, date change callback,
/// calendar theme, and date range.
///
/// ### Properties:
///
/// - [initialDate] : The initial date to be displayed when the calendar is first loaded.
/// - [onDateChanged] : Callback function that is called whenever the selected date changes.
/// - [calendarTheme] : The theme to be applied to the calendar.
/// - [firstDateRange] : The earliest date that can be selected.
/// - [lastDateRange] : The latest date that can be selected.
///
/// ### Methods:
///
/// - [build] : Overrides the build method to construct the UI for the custom calendar widget.
///
/// ### Example usage:
/// ```dart
/// CustomCalendarWidget(
///   initialDate: Jalali(1400, 1, 1),
///   onDateChanged: (Jalali? date) {
///     // Handle the date change
///   },
///   calendarTheme: CalendarTheme(
///     color: Colors.blue,
///   ),
///   firstDateRange: Jalali(1390, 1, 1),
///   lastDateRange: Jalali(1450, 12, 29),
/// );
/// ```
///
class JalaliFlutterDatePicker extends StatefulWidget {
  final Jalali initialDate;
  final ValueChanged<Jalali?> onDateChanged;
  final Jalali firstDateRange;
  final Jalali lastDateRange;
  final Widget customArrowWidget;
  final Color? disabledDayColor;
  final Color? enabledDayColor;
  final Color? selectedDayColor;
  final Color? selectedDayBackground;
  final Color? todayColor;
  final Color? footerIconColor;
  final TextStyle? footerTextStyle;
  final TextStyle? headerTextStyle;
  final TextStyle? selectedYearTextStyle;
  final TextStyle? yearsDropDownItemTextStyle;
  final TextStyle? selectedMonthTextStyle;
  final TextStyle? monthDropDownItemTextStyle;
  final String? language;

  const JalaliFlutterDatePicker({
    super.key,
    required this.initialDate,
    required this.onDateChanged,
    required this.firstDateRange,
    required this.lastDateRange,
    this.customArrowWidget = const Icon(CupertinoIcons.chevron_down),
    this.disabledDayColor = Colors.white,
    this.enabledDayColor = Colors.black,
    this.selectedDayColor = Colors.white,
    this.selectedDayBackground = Colors.green,
    this.todayColor = Colors.green,
    this.footerIconColor = Colors.green,
    TextStyle? footerTextStyle,
    TextStyle? headerTextStyle,
    this.selectedYearTextStyle,
    this.yearsDropDownItemTextStyle,
    this.selectedMonthTextStyle,
    this.monthDropDownItemTextStyle,
    this.language,
  })  : footerTextStyle = footerTextStyle ??
            const TextStyle(color: Colors.black, fontSize: 12),
        headerTextStyle = headerTextStyle ??
            const TextStyle(
              color: Colors.black,
              fontSize: 12,
              overflow: TextOverflow.ellipsis,
            );

  @override
  _JalaliFlutterDatePickerState createState() =>
      _JalaliFlutterDatePickerState();
}

class _JalaliFlutterDatePickerState extends State<JalaliFlutterDatePicker> {
  late ValueNotifier<Jalali> _selectedDateNotifier;

  ///Note year and month selected Number
  late int selectedYearNumber = widget.initialDate.year;
  late int selectedMonthNumber = widget.initialDate.month;

  ///Note initial drop down state open or close
  bool isMonthDropdownOpen = false;
  bool isYearDropdownOpen = false;

  ///Note convert month selected number to name of week
  late String selectedMonthName = getMonthNameFromList(
      widget.firstDateRange.month,
      widget.language == "dari"
          ? CalendarConstant.dariMonthList
          : CalendarConstant.persianMonthList);
  late String selectedYearName = widget.initialDate.year.toString();

  ///Note month and year scroll controller
  final monthScrollController = ScrollController();
  final yearScrollController = ScrollController();
  String language() {
    return widget.language == "dari" ? "dari" : "persian";
  }

  late List<MonthModel> monthList =
      monthGenerator(widget.firstDateRange.month, language: language());

  int monthLength() {
    return monthList.length;
  }

  @override
  void initState() {
    super.initState();

    // Initialize the month list based on the initial date
    _selectedDateNotifier = ValueNotifier<Jalali>(widget.initialDate);
    selectedYearNumber = widget.initialDate.year;
    if (selectedYearNumber == widget.firstDateRange.year) {
      monthList =
          monthGenerator(widget.firstDateRange.month, language: language());
    } else if (selectedYearNumber == widget.lastDateRange.year) {
      monthList = monthGenerator(1, language: language())
          .where((month) => month.monthId <= widget.lastDateRange.month)
          .toList();
    } else {
      monthList = monthGenerator(1, language: language());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: CustomErrorHandler(
        child: ValueListenableBuilder<Jalali>(
          valueListenable: _selectedDateNotifier,
          builder: (context, selectedDate, _) {
            return Center(
              child: Container(
                height: 440,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xffE9E9E9),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, right: 10, left: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 85),
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    CalendarHeaders(
                                      textStyle: widget.headerTextStyle!,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    PCalendarDatePicker(
                                      onDisplayedMonthChanged: (value) {
                                        // Update the selected year name and number
                                        selectedYearName =
                                            value!.year.toString();
                                        selectedYearNumber = value.year;

                                        // Update the selected date notifier value
                                        _selectedDateNotifier.value = value;

                                        // Using if-else for conditions since Dart's switch-case does not support complex conditions directly
                                        if (selectedYearNumber ==
                                            widget.firstDateRange.year) {
                                          // Case: Selected year is the first year in the range
                                          setState(() {
                                            // Generate month list starting from the first valid month
                                            monthList = monthGenerator(
                                                widget.firstDateRange.month,
                                                language: language());
                                          });
                                          // Calculate the month index based on the first valid month
                                          int monthIndex = value.month -
                                              widget.firstDateRange.month;
                                          // Set the selected month name based on the month index
                                          selectedMonthName =
                                              monthList[monthIndex].monthName;
                                        } else if (selectedYearNumber ==
                                            widget.lastDateRange.year) {
                                          // Case: Selected year is the last year in the range
                                          setState(() {
                                            // Generate month list starting from January (1)
                                            monthList = monthGenerator(1,
                                                language: language());
                                            // Filter the months to include only up to the last valid month
                                            monthList = monthList
                                                .where((month) =>
                                                    month.monthId <=
                                                    widget.lastDateRange.month)
                                                .toList();
                                          });
                                          // Calculate the month index for the last year
                                          int monthIndex = value.month - 1;
                                          // Set the selected month name based on the month index
                                          selectedMonthName =
                                              monthList[monthIndex].monthName;
                                        } else {
                                          // Case: Selected year is neither the first nor the last in the range
                                          if (monthLength() < 12) {
                                            setState(() {
                                              // Generate month list starting from January (1)
                                              monthList = monthGenerator(1,
                                                  language: language());
                                            });
                                          }
                                          // Set the selected month name based on the current month
                                          selectedMonthName =
                                              monthList[value.month - 1]
                                                  .monthName;
                                        }
                                      },
                                      key: UniqueKey(),
                                      initialDate: selectedDate,
                                      firstDate: widget.firstDateRange,
                                      lastDate: widget.lastDateRange,
                                      enabledDayColor: widget.enabledDayColor!,
                                      onDateChanged: (date) {
                                        _selectedDateNotifier.value = date!;
                                        // Call the onDateSelected callback passed from the constructor
                                        widget.onDateChanged(date);
                                      },
                                      initialCalendarMode: PDatePickerMode.day,
                                      disabledDayColor:
                                          widget.disabledDayColor!,
                                      selectedDayColor:
                                          widget.selectedDayColor!,
                                      selectedDayBackground:
                                          widget.selectedDayBackground!,
                                      todayColor: widget.todayColor!,
                                      footerIconColor: widget.footerIconColor!,
                                      footerTextStyle: widget.footerTextStyle!,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: monthSelection(
                                      widget.selectedMonthTextStyle,
                                      widget.monthDropDownItemTextStyle,
                                      customArrowWidget:
                                          widget.customArrowWidget,
                                      startMonth: widget.firstDateRange.month),
                                ),
                                Expanded(
                                  child: yearSelection(
                                      customArrowWidget:
                                          widget.customArrowWidget,
                                      widget.firstDateRange.year,
                                      widget.lastDateRange.year,
                                      widget.selectedYearTextStyle,
                                      widget.yearsDropDownItemTextStyle),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget yearSelection(int startYear, int endYear,
      TextStyle? selectedYearTextStyle, TextStyle? yearsDropDownItemTextStyle,
      {required Widget customArrowWidget}) {
    List<YearModel> yearList = yearGenerator(startYear, endYear);
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.all(8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isYearDropdownOpen = !isYearDropdownOpen;
                  });
                },
                child: Container(
                  // color: Colors.white,
                  child: Column(
                    children: [
                      AnimatedContainer(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            width: 1,
                            color: const Color(0xffE9E9E9),
                          ),
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: const Duration(milliseconds: 600),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 16),
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(selectedYearName,
                                        style: selectedYearTextStyle ??
                                            const TextStyle(fontSize: 15)),
                                    AnimatedCrossFade(
                                      firstChild: SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: customArrowWidget),
                                      secondChild: RotatedBox(
                                        quarterTurns: 2,
                                        child: SizedBox(
                                            height: 24,
                                            width: 24,
                                            child: customArrowWidget),
                                      ),
                                      crossFadeState: isYearDropdownOpen == true
                                          ? CrossFadeState.showSecond
                                          : CrossFadeState.showFirst,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      secondCurve: Curves.easeIn,
                                      sizeCurve: Curves.easeOut,
                                    ),
                                  ]),
                              AnimatedCrossFade(
                                crossFadeState: isYearDropdownOpen
                                    ? CrossFadeState.showSecond
                                    : CrossFadeState.showFirst,
                                duration: const Duration(milliseconds: 600),
                                reverseDuration: Duration.zero,
                                sizeCurve: Curves.fastLinearToSlowEaseIn,
                                firstChild: Container(),
                                secondChild: Column(
                                  children: [
                                    const Divider(
                                      thickness: 1,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      child: RawScrollbar(
                                        padding: EdgeInsets.zero,
                                        controller: yearScrollController,
                                        thumbVisibility: true,
                                        interactive: false,
                                        trackVisibility: false,
                                        minThumbLength: 5,
                                        radius: const Radius.circular(5),
                                        thickness: 8.0,
                                        child: yearList.isNotEmpty
                                            ? SizedBox(
                                                height: 200,
                                                child: ListView.builder(
                                                  controller:
                                                      yearScrollController,
                                                  itemCount: yearList.length,
                                                  padding: EdgeInsets.zero,
                                                  itemBuilder:
                                                      (context, index) =>
                                                          GestureDetector(
                                                    onTap: () {
                                                      selectedYearNumber =
                                                          yearList[index]
                                                              .yearId;

                                                      if (selectedYearNumber ==
                                                          widget.firstDateRange
                                                              .year) {
                                                        // Case: Selected year is the first year in the range
                                                        setState(() {
                                                          monthList = monthGenerator(
                                                              widget
                                                                  .firstDateRange
                                                                  .month,
                                                              language:
                                                                  language());
                                                          selectedMonthName = getMonthNameFromList(
                                                              widget
                                                                  .firstDateRange
                                                                  .month,
                                                              widget.language ==
                                                                      "dari"
                                                                  ? CalendarConstant
                                                                      .dariMonthList
                                                                  : CalendarConstant
                                                                      .persianMonthList);
                                                          selectedMonthNumber =
                                                              widget
                                                                  .firstDateRange
                                                                  .month;
                                                          isYearDropdownOpen =
                                                              !isYearDropdownOpen;
                                                          selectedYearName =
                                                              yearList[index]
                                                                  .yearName
                                                                  .toString();
                                                        });
                                                        _selectedDateNotifier
                                                                .value =
                                                            Jalali(
                                                                selectedYearNumber,
                                                                widget
                                                                    .firstDateRange
                                                                    .month,
                                                                1);
                                                      } else if (selectedYearNumber ==
                                                          widget.lastDateRange
                                                              .year) {
                                                        // Case: Selected year is the last year in the range
                                                        _selectedDateNotifier
                                                                .value =
                                                            Jalali(
                                                                selectedYearNumber,
                                                                widget
                                                                    .lastDateRange
                                                                    .month,
                                                                1);
                                                        setState(() {
                                                          monthList = monthGenerator(
                                                                  1,
                                                                  language:
                                                                      language())
                                                              .where((month) =>
                                                                  month
                                                                      .monthId <=
                                                                  widget
                                                                      .lastDateRange
                                                                      .month)
                                                              .toList();
                                                          selectedMonthName = getMonthNameFromList(
                                                              widget
                                                                  .lastDateRange
                                                                  .month,
                                                              widget.language ==
                                                                      "dari"
                                                                  ? CalendarConstant
                                                                      .dariMonthList
                                                                  : CalendarConstant
                                                                      .persianMonthList);
                                                          selectedMonthNumber =
                                                              widget
                                                                  .lastDateRange
                                                                  .month;
                                                          isYearDropdownOpen =
                                                              !isYearDropdownOpen;
                                                          selectedYearName =
                                                              yearList[index]
                                                                  .yearName
                                                                  .toString();
                                                        });
                                                      } else {
                                                        // Case: Selected year is neither the first nor the last in the range
                                                        if (monthLength() <
                                                            12) {
                                                          setState(() {
                                                            monthList =
                                                                monthGenerator(
                                                                    1,
                                                                    language:
                                                                        language());
                                                          });
                                                        }
                                                        _selectedDateNotifier
                                                                .value =
                                                            Jalali(
                                                                selectedYearNumber,
                                                                _selectedDateNotifier
                                                                    .value
                                                                    .month,
                                                                1);
                                                        setState(() {
                                                          isYearDropdownOpen =
                                                              !isYearDropdownOpen;
                                                          selectedYearName =
                                                              yearList[index]
                                                                  .yearName
                                                                  .toString();
                                                        });
                                                      }
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 16.0),
                                                      child: SizedBox(
                                                        height: 25,
                                                        child: Text(
                                                            yearList[index]
                                                                .yearName
                                                                .toString(),
                                                            style: yearsDropDownItemTextStyle ??
                                                                const TextStyle(
                                                                    fontSize:
                                                                        14)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : const Align(
                                                alignment: Alignment.topRight,
                                                child: Text('لیست خالی است'),
                                              ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget monthSelection(
    TextStyle? selectedMonthTextStyle,
    TextStyle? monthDropDownItemTextStyle, {
    required Widget customArrowWidget,
    required int startMonth,
  }) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isMonthDropdownOpen = !isMonthDropdownOpen;
                  });
                },
                child: Container(
                  // color: Colors.white,
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                width: 1, color: const Color(0xffE9E9E9))),
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: const Duration(milliseconds: 600),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 16),
                          child: Column(
                            children: [
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      selectedMonthName,
                                      style: selectedMonthTextStyle ??
                                          const TextStyle(fontSize: 15),
                                    ),
                                    AnimatedCrossFade(
                                      firstChild: SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: customArrowWidget),
                                      secondChild: SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: RotatedBox(
                                              quarterTurns: 2,
                                              child: customArrowWidget)),
                                      crossFadeState:
                                          isMonthDropdownOpen == true
                                              ? CrossFadeState.showSecond
                                              : CrossFadeState.showFirst,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      secondCurve: Curves.easeIn,
                                      sizeCurve: Curves.easeOut,
                                    ),
                                  ]),
                              AnimatedCrossFade(
                                crossFadeState: isMonthDropdownOpen
                                    ? CrossFadeState.showSecond
                                    : CrossFadeState.showFirst,
                                duration: const Duration(milliseconds: 600),
                                reverseDuration: Duration.zero,
                                sizeCurve: Curves.fastLinearToSlowEaseIn,
                                firstChild: Container(),
                                secondChild: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Divider(
                                      thickness: 1,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    RawScrollbar(
                                      padding: EdgeInsets.zero,
                                      controller: monthScrollController,
                                      thumbVisibility: true,
                                      interactive: false,
                                      trackVisibility: false,
                                      minThumbLength: 5,
                                      radius: const Radius.circular(5),
                                      thickness: 8.0,
                                      child: CalendarConstant.persianMonthList
                                                  .isNotEmpty ||
                                              CalendarConstant
                                                  .dariMonthList.isNotEmpty
                                          ? SizedBox(
                                              height: 200,
                                              child: ListView.builder(
                                                padding: EdgeInsets.zero,
                                                controller:
                                                    monthScrollController,
                                                itemCount: monthList.length,
                                                itemBuilder: (context, index) =>
                                                    GestureDetector(
                                                  onTap: () {
                                                    selectedMonthNumber =
                                                        monthList[index]
                                                            .monthId;
                                                    _selectedDateNotifier
                                                            .value =
                                                        Jalali(
                                                            selectedYearNumber,
                                                            monthList[index]
                                                                .monthId,
                                                            1);
                                                    setState(() {
                                                      isMonthDropdownOpen =
                                                          !isMonthDropdownOpen;
                                                      selectedMonthName =
                                                          monthList[index]
                                                              .monthName;
                                                    });
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 16.0),
                                                    child: SizedBox(
                                                      height: 25,
                                                      child: Text(
                                                        monthList[index]
                                                            .monthName
                                                            .toString(),
                                                        style:
                                                            monthDropDownItemTextStyle ??
                                                                const TextStyle(
                                                                    fontSize:
                                                                        14),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : const Align(
                                              alignment: Alignment.topRight,
                                              child: Text('نتیجه ای یافت نشد'),
                                            ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
