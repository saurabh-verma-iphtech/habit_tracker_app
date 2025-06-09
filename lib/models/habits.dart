class Habit {
  final String id;
  final String name;
  final List<DateTime> completedDays;

  Habit({required this.id, required this.name, required this.completedDays});

  Habit markCompleted(DateTime date) {
    return Habit(id: id, name: name, completedDays: [...completedDays, date]);
  }
}



