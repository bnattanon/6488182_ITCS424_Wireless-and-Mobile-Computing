import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'event_model.dart';
import 'main_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => EventModel(
        title: 'Badminton Day!!!',
        date: DateTime(2024, 1, 18, 10, 0),
        location: 'ICT Mahidol',
        description: 'at muict court. DONT forget to bring the thing. fkwapeof Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco',
        weather: 'Sunny, 20°C',
      ),
      child: MaterialApp(
        title: 'Event App',
        home: MainPage(),
      ),
    ),
  );
}
