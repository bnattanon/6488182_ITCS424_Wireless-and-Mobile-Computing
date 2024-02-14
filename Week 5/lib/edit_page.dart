import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'event_model.dart';
import 'package:intl/intl.dart';

class EditPage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Access the event model from the provider
    final eventModel = Provider.of<EventModel>(context);

    // Initialize the text controllers with the current event data
    titleController.text = eventModel.title;
    descriptionController.text = eventModel.description;
    timeController.text = DateFormat('hh:mm a').format(eventModel.date);
    locationController.text = eventModel.location;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Event'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
            maxLines: null,
          ),
          TextField(
            controller: timeController,
            decoration: InputDecoration(labelText: 'Time'),
            keyboardType: TextInputType.datetime,
            onTap: () async {
              // Prevent the keyboard from appearing
              FocusScope.of(context).requestFocus(new FocusNode());
              // Show the date picker dialog
              final timeOfDay = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(eventModel.date),
              );
              if (timeOfDay != null) {
                // Update the time controller text with the new time
                timeController.text = timeOfDay.format(context);
              }
            },
          ),
          TextField(
            controller: locationController,
            decoration: InputDecoration(labelText: 'Location'),
          ),
          ElevatedButton(
            child: Text('Save'),
            onPressed: () {
              // Update the event model with the new data
              eventModel.updateEvent(
                title: titleController.text,
                description: descriptionController.text,
                location: locationController.text,
                // Update the event model date with the new time
                date: DateFormat('hh:mm a').parse(timeController.text),
              );
              // Go back to the previous screen
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
