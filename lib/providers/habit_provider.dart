import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/models/habits.dart';




final habitProvider = StateNotifierProvider<HabitNotifier, List<Habit>>((ref) {
  return HabitNotifier();
});


class HabitNotifier extends StateNotifier<List<Habit>> {
  HabitNotifier() : super([]);

  void addHabit(String name) {
    final newHabit = Habit(
      id: DateTime.now().toString(),
      name: name,
      completedDays: [],
    );
    state = [...state, newHabit];
  }

  void toggleHabitCompletion(String id) {
    final today = DateTime.now();
    final todayDate = DateTime(
      today.year,
      today.month,
      today.day,
    ); // Remove time part

    state =
        state.map((habit) {
          if (habit.id == id) {
            if (habit.completedDays.contains(todayDate)) {
              // If already completed today, remove the date
              return Habit(
                id: habit.id,
                name: habit.name,
                completedDays:
                    habit.completedDays
                        .where((date) => date != todayDate)
                        .toList(),
              );
            } else {
              // Otherwise, mark as completed
              return Habit(
                id: habit.id,
                name: habit.name,
                completedDays: [...habit.completedDays, todayDate],
              );
            }
          }
          return habit;
        }).toList();
  }

  void editHabit(String id, String newName) {
    state =
        state.map((habit) {
          if (habit.id == id) {
            return Habit(
              id: habit.id,
              name: newName,
              completedDays: habit.completedDays,
            );
          }
          return habit;
        }).toList();
  }

  void removeHabit(String id) {
    state = state.where((habit) => habit.id != id).toList();
  }
}
