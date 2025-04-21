import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  late String time, continent, city, flag;

  WorldTime({required this.continent, required this.city, required this.flag});

  Future<void> getTime() async {
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

    time = current.toString();
  }
}
