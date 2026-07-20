
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({super.key});

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDatePicker(
              switchToCalendarEntryModeIcon: Icon(
                Icons.calendar_month,
                color: Colors.green,
              ),
              switchToInputEntryModeIcon: Icon(
                Icons.edit_calendar,
                color: Colors.green,
              ),
              context: context,
              initialDate: today,
              firstDate: DateTime(2025),
              lastDate: DateTime(2050),
              initialEntryMode: DatePickerEntryMode.calendar, //
              selectableDayPredicate: (DateTime date) {
                if (date.weekday == DateTime.friday) {
                  return false;
                }
                return true;
              },
              helpText: 'Select a Date',
              cancelText: 'Cancel',
              confirmText: 'Confirm',
              // locale: const Locale('ar'),
              barrierDismissible: false, // هل يغلق عند الضغط خارج النافذة
              barrierColor: const Color.fromRGBO(0, 0, 0, 0.541),
              useRootNavigator: true,

              // builder: (BuildContext context, Widget? child) {
              //   return Theme(
              //     data: ThemeData.light().copyWith(
              //       colorScheme: const ColorScheme.light(
              //         primary: Colors.green,
              //         onPrimary: Color.fromARGB(255, 230, 227, 227),
              //         surface: Colors.white,
              //         onSurface: Colors.black,
              //       ),
              //       textTheme: const TextTheme(
              //         bodyMedium: TextStyle(color: Colors.black, fontSize: 14),
              //       ),
              //     ),
              //     child: child!,
              //   );
              // },
              //   initialDatePickerMode: DatePickerMode.year,
              errorFormatText: 'Invalid format.',
              errorInvalidText: 'Out of range.',
              fieldHintText: 'Month/Date/Year',
              fieldLabelText: 'Enter date',
              keyboardType: TextInputType.datetime,
              anchorPoint: Offset(-100, -100),
            ).then((pickedDate) {
              print(
                'pickedDate: ${DateFormat('yyyy-MM-dd').format(pickedDate!)}',
              );
              setState(() {
                today = pickedDate;
              });
            });
          },

          child: Text('Pick Date'),
        ),
      ),
    );
  }
}