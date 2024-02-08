import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const RecycleMania());
}

const defaultTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.white,
  fontFamily: "Nunito",
);

class RecycleMania extends StatelessWidget {
  const RecycleMania({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recycle Mania',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 25, 25, 25),
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
