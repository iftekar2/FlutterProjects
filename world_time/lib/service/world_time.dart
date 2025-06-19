import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = "";
  String flag;
  String url;
  bool isDayTime = false;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // Make request to the World Time API
      Response response = await get(
        Uri.parse('https://worldtimeapi.org/api/timezone/$url'),
      );
      // Store the response data
      Map data = jsonDecode(response.body);

      // Extract the datetime from the data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // Create a DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;

      // Set the time property
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Caught error: $e');
      time = 'Could not get time data';
    }
  }
}
