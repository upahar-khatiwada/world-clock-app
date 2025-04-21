import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String time, continent, city, flag;
  bool isDayTime = true;
  bool isEveningTime = true;
  bool isMorningTime = true;
  bool isNightTime = true;

  WorldTime({required this.continent, required this.city, required this.flag});

  Future<void> getTime() async {
    try {
      Response response = await get(
        Uri.parse(
          'https://timeapi.io/api/time/current/zone?timeZone=$continent/$city',
        ),
      );
      Map data = jsonDecode(response.body);
      // print(data);

      String current_datetime = data['dateTime'];
      // print(current_datetime);

      DateTime current = DateTime.parse(current_datetime);
      // print(current);

      // time = current.toString();
      isMorningTime = current.hour >= 6 && current.hour < 12;
      isDayTime = current.hour >= 12 && current.hour < 16;
      isEveningTime = current.hour >= 16 && current.hour < 20;
      isNightTime = current.hour >= 20 || current.hour < 6;
      time = DateFormat.jm().format(current);
    } catch (e) {
      print('Error: $e');
      time = 'Error';
    }
  }
}
