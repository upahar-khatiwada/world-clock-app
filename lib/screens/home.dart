import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

String capitalize(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1).toLowerCase();
}

class _HomeState extends State<Home> {
  Map api_data_from_loading_widget = {};

  @override
  Widget build(BuildContext context) {
    if (api_data_from_loading_widget.isEmpty) {
      api_data_from_loading_widget =
          ModalRoute.of(context)!.settings.arguments as Map;
    }

    print(api_data_from_loading_widget);

    //BG image
    String bgImage = 'day.jpg';
    Color bgColor = Colors.black45;
    Color textColor = Colors.white70;
    if (api_data_from_loading_widget['isDayTime']) {
      bgImage = 'day.jpg';
      bgColor = HexColor("#baddff");
      textColor = Colors.black87;
    }
    if (api_data_from_loading_widget['isNightTime']) {
      bgImage = 'night.jpg';
      bgColor = HexColor("#51546a");
      textColor = Colors.white;
    }
    if (api_data_from_loading_widget['isEveningTime']) {
      bgImage = 'evening.jpg';
      bgColor = Colors.black45;
      textColor = Colors.white;
    }
    if (api_data_from_loading_widget['isMorningTime']) {
      bgImage = 'morning.jpg';
      bgColor = HexColor("#d4eff7");
      textColor = HexColor("#00000");
    }

    return (Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 280, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 21,
                      letterSpacing: 1,
                    ),
                  ),
                  icon: Icon(Icons.edit_location, color: textColor, size: 25),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      capitalize(api_data_from_loading_widget['city']),
                      style: TextStyle(
                        fontSize: 32,
                        letterSpacing: 2,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Text(
                  api_data_from_loading_widget['time'],
                  style: TextStyle(fontSize: 50, color: textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
