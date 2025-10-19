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

  // 선택된 날짜인지 아닌지 판단
  bool _selectedDayPredicate(day) {
    final isSelected = isSameDay(_selectedDay, day);

    return isSelected;
  }

  // 날짜 선택시 호출되는 함수
  void _onDaySelected(selectedDay, focusedDay) {
    setState(() {
      _selectedDay = selectedDay; // 선택한 날짜
      _focusedDay = focusedDay; // 포커스된 날짜
    });
  }

  // 클래스 안에 데이터 저장
  final Map<DateTime, List<String>> _events = {
    // Datetime.now() 를 하면 2025-10-19 17:35:00.000 이 되어 비교가 안됨
    DateTime.utc(2025, 10, 15): ['출근', '퇴근', '회의', '점심', '스터디', '운동', '운동'],
    DateTime.utc(2025, 10, 16): ['지각'],
  };

  // 특정 날짜의 이벤트 가져오기 ( 형태는 아까 a와 같음 )
  List<String> _getEventsForDay(DateTime day) {
    final key = DateTime.utc(day.year, day.month, day.day);

    return _events[key] ?? [];
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
                // rerender 하면서 내가 선택한 날짜를 강조
                selectedDayPredicate: _selectedDayPredicate,
                // 날짜 선택시 호출되는 함수 ( onTab 과 비슷 )
                onDaySelected: _onDaySelected,
                // > 위 특정 날짜 이벤트 가져오기 함수 연결
                //    >> marker 표시가 자동으로 표시 됨
                //    >> ( 2025-10-15일에 2개, 16일에 1개 )
                eventLoader: _getEventsForDay,
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
