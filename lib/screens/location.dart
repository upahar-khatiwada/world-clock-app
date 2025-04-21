import 'package:flutter/material.dart';
import 'package:world_clock/worldTime_class.dart';
import 'package:world_clock/screens/home.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List locations = [
    WorldTime(continent: 'asia', city: 'kathmandu', flag: 'Nepal.png'),
    WorldTime(continent: 'asia', city: 'bangkok', flag: 'Thailand.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  'Choose Location',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Divider(thickness: 2, indent: 20, endIndent: 20),
            Expanded(
              child: ListView.builder(
                itemCount: locations.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      title: Text(capitalize(locations[index].city)),
                    ),
                  );
                },
              ),
            ),
            // SizedBox(height: 30),
            // TextButton.icon(
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            //   label: Text(
            //     'Go BACK!',
            //     style: TextStyle(color: Colors.black87, fontSize: 20),
            //   ),
            //   icon: Icon(Icons.arrow_left, color: Colors.black87, size: 25),
            // ),
          ],
        ),
      ),
    );
  }
}
