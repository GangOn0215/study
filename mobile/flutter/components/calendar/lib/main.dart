import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

void main() async {
  await initializeDateFormatting('ko_Kr', null);

  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // 선택 돤 날짜
  DateTime _selectedDay = DateTime.now();
  // 포커스 된 날짜
  DateTime _focusedDay = DateTime.now();

  bool _selectedDayPredicate(day) {
    final isSelected = isSameDay(_selectedDay, day);

    return isSelected;
  }

  void _onDaySelected(selectedDay, focusedDay) {
    setState(() {
      _selectedDay = selectedDay; // 선택한 날짜
      _focusedDay = focusedDay; // 포커스된 날짜
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 50),
            Center(
              child: TableCalendar(
                firstDay: DateTime.utc(2025, 1, 1, 0, 0, 0),
                focusedDay: _focusedDay,
                lastDay: DateTime.utc(2025, 12, 31, 0, 0, 0),

                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextFormatter: (date, locale) =>
                      DateFormat.yMMMM('ko_KR').format(date),
                ),
                selectedDayPredicate: _selectedDayPredicate,
                onDaySelected: _onDaySelected,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
