import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HabitCalendar extends StatelessWidget {
  final List<DateTime> completedDays;

  const HabitCalendar({super.key, required this.completedDays});
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime(2000),
      lastDay: DateTime(2100),
      calendarFormat: CalendarFormat.week,

      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        markerDecoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
      ),
      eventLoader: (day) => completedDays.contains(day) ? [day] : [],
      
    );
  }
}
