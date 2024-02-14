import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'edit_page.dart';
import 'event_model.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var eventModel = Provider.of<EventModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(eventModel.title),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditPage()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(DateFormat('EEEE, dd MMMM yyyy').format(eventModel.date)),
            subtitle: Text(DateFormat('hh:mm a').format(eventModel.date)),
          ),
          ListTile(
            title: Text(eventModel.location),
            subtitle: Text(eventModel.description),
          ),
          // Weather forecast section
          Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.blue[100], // Background color
            child: Row(
              children: <Widget>[
                Icon(Icons.wb_sunny, color: Color.fromARGB(0, 0, 0, 0)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Weather forecast',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Bangkok'),
                      Text('Mostly sunny'),
                      Text('Humidity: 55%'),
                      Text('Precip: 0%'),
                      Text('Wind: 2km/h'),
                    ],
                  ),
                ),
                Text(
                  '20°C',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // "Chance of Rain" section
          Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.green[300],
            child: Text('Chance of Rain: Very low (22.5%)',
            textAlign: TextAlign.center,
            style: TextStyle(
            color: Colors.white, // White text for better readability on green background
    ),
  ),
),
          // Map image
          Container(
            height: 330, // Set the image height
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/map.png'), 
              ),
            ),
          ),
        ],
      ),
    );
  }
}
