import 'package:flutter/material.dart';

class EventModel with ChangeNotifier {
  String title;
  DateTime date;
  String location;
  String description;
  String weather;

  EventModel({
    required this.title,
    required this.date,
    required this.location,
    required this.description,
    required this.weather,
  });

  void updateEvent({
    String? title,
    DateTime? date,
    String? location,
    String? description,
    String? weather,
  }) {
    this.title = title ?? this.title;
    this.date = date ?? this.date;
    this.location = location ?? this.location;
    this.description = description ?? this.description;
    this.weather = weather ?? this.weather;
    notifyListeners();
  }
}
