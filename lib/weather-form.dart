import 'package:flutter/material.dart';
import './weather.dart';

class WeatherForm extends StatefulWidget {
  @override
  _WeatherFormState createState() => _WeatherFormState();
}

class _WeatherFormState extends State<WeatherForm> {
  String? city;
  final TextEditingController cityEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(city ?? 'Enter a City'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: cityEditingController,
              decoration: InputDecoration(hintText: 'Type a city..'),
              onChanged: (str) {
                setState(() {
                  city = str;
                });
              },
              onSubmitted: (str) {
                if (str.isNotEmpty) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Weather(str)),
                  );
                  cityEditingController.clear();
                }
              },
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                ),
                child: Text(
                  'Get Weather',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (city != null && city!.isNotEmpty) {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Weather(city!)),
                    );
                    cityEditingController.clear();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
