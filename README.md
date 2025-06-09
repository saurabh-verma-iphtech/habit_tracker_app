📅 Habit Tracker App — Build Healthy Habits with Ease 💪

Habit Tracker App is a Flutter project that helps you create, track, edit, and visualize daily habits using Riverpod for state management and a custom calendar widget.

🌟 Project Highlights

✅ Add & Manage Habits

Add Habits: Tap the “+” button to create a new habit via an AlertDialog.

Edit Habits: Rename habits with an edit icon, using a pre-filled dialog.

Remove Habits: Delete habits instantly with a delete button.

📆 Habit Calendar View

Displays a mini calendar for each habit showing completed days.

Strikethrough habit name when marked complete for today.

Tap the check-circle icon to toggle today’s completion state.

🔄 State Management with Riverpod

habitProvider (StateNotifierProvider): maintains a list of Habit objects with IDs, names, and a Set<DateTime> of completed days.

Methods: addHabit, removeHabit, editHabit, toggleHabitCompletion.

UI rebuilds automatically on state changes.

🎨 UI & Theming

Modern AppBar with bold title “Habit Tracker.”

Card-based ListView for a clean habit list layout.

Colorful icons for edit (blue), delete (red), and completion (green or grey).

FloatingActionButton for quick habit addition.

🧰 Tech Stack

    Category                  Tools & Libraries

    Framework                 Flutter, Dart

    State Management          Riverpod (flutter_riverpod)

    Persistence               shared_preferences

    Widgets                   Material (Card, ListTile, AlertDialog)

    Custom Widget             HabitCalendar
