import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/widgets/habit_calender.dart';
import '../providers/habit_provider.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habits = ref.watch(habitProvider);
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Habit Tracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body:
          habits.isEmpty
              ? Center(child: Text("No habits yet. Add one!"))
              : ListView.builder(
                itemCount: habits.length,
                itemBuilder: (context, index) {
                  final habit = habits[index];
                  final isCompletedToday = habit.completedDays.contains(
                    todayDate,
                  );

                  return Card(
                    shadowColor: Colors.black,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: ListTile(
                      title: Text(
                        habit.name,
                        style: TextStyle(
                          decoration:
                              isCompletedToday
                                  ? TextDecoration.lineThrough
                                  : null,
                          color: isCompletedToday ? Colors.grey : Colors.black,
                        ),
                      ),
                      subtitle: HabitCalendar(
                        completedDays: habit.completedDays,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed:
                                () => _editHabitDialog(
                                  context,
                                  ref,
                                  habit.id,
                                  habit.name,
                                ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed:
                                () => ref
                                    .read(habitProvider.notifier)
                                    .removeHabit(habit.id),
                          ),
                          IconButton(
                            icon: Icon(
                              isCompletedToday
                                  ? Icons.check_circle
                                  : Icons.circle_outlined,
                              color:
                                  isCompletedToday ? Colors.green : Colors.grey,
                            ),
                            onPressed:
                                () => ref
                                    .read(habitProvider.notifier)
                                    .toggleHabitCompletion(habit.id),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addHabitDialog(context, ref),
        child: Icon(Icons.add),
      ),
    );
  }

  void _addHabitDialog(BuildContext context, WidgetRef ref) {
    final _habitController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text('Add New Habit'),
            content: TextField(
              controller: _habitController,
              decoration: InputDecoration(labelText: 'Habit Name'),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  ref
                      .read(habitProvider.notifier)
                      .addHabit(_habitController.text);
                  Navigator.pop(context);
                },
                child: Text('Add'),
              ),
            ],
          ),
    );
  }

  void _editHabitDialog(
    BuildContext context,
    WidgetRef ref,
    String habitId,
    String oldName,
  ) {
    final _habitController = TextEditingController(text: oldName);

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text('Edit Habit'),
            content: TextField(
              controller: _habitController,
              decoration: InputDecoration(labelText: 'Habit Name'),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  ref
                      .read(habitProvider.notifier)
                      .editHabit(habitId, _habitController.text);
                  Navigator.pop(context);
                },
                child: Text('Save'),
              ),
            ],
          ),
    );
  }
}
