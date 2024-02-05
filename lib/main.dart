import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const RecycleMania());
}

const defaultTextStyle = TextStyle(
  fontSize: 16,
);

class RecycleMania extends StatelessWidget {
  const RecycleMania({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recycle Mania',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.copyWith(
              bodyLarge: defaultTextStyle,
              bodySmall: defaultTextStyle,
              bodyMedium: defaultTextStyle,
            ),
      ),
      home: const HomeScreen(),
    );
  }
}
