import 'package:flutter/material.dart';

class TimePickerPage extends StatefulWidget {
  const TimePickerPage({super.key});

  @override
  State<TimePickerPage> createState() => _TimePickerPageState();
}

class _TimePickerPageState extends State<TimePickerPage> {
  TimeOfDay? selecttedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selecttedTime == null
                  ? "Selected Time "
                  : selecttedTime!.format(context),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                TimeOfDay? result = await showTimePicker(
                  //  initialEntryMode: TimePickerEntryMode.input,
                  confirmText: "agree",
                  orientation: Orientation.landscape,
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                selecttedTime = result;
                setState(() {});
              },
              child: const Text("choose a time"),
            ),
          ],
        ),
      ),
    );
  }
}
