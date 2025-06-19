import 'package:flutter/material.dart';
import 'package:world_time/service/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
      url: 'Europe/London',
      location: 'London',
      flag:
          'https://cdn3.iconfinder.com/data/icons/world-flags-square-vol-3/48/United_Kingdom-512.png',
    ),
    WorldTime(
      url: 'Europe/Berlin',
      location: 'Athens',
      flag:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Greece.svg/1200px-Flag_of_Greece.svg.png',
    ),
    WorldTime(
      url: 'Africa/Cairo',
      location: 'Cairo',
      flag: 'https://cdn.britannica.com/85/185-050-6A8E2E8A/Flag-Egypt.jpg',
    ),
    WorldTime(
      url: 'Africa/Nairobi',
      location: 'Nairobi',
      flag:
          'https://upload.wikimedia.org/wikipedia/commons/4/49/Flag_of_Kenya.svg',
    ),
    WorldTime(
      url: 'America/Chicago',
      location: 'Chicago',
      flag:
          'https://cdn.britannica.com/33/4833-050-F6E415FE/Flag-United-States-of-America.jpg',
    ),
    WorldTime(
      url: 'America/New_York',
      location: 'New York',
      flag:
          'https://cdn.britannica.com/33/4833-050-F6E415FE/Flag-United-States-of-America.jpg',
    ),
    WorldTime(
      url: 'Asia/Seoul',
      location: 'Seoul',
      flag:
          'https://github.com/iamshaunjp/flutter-beginners-tutorial/blob/lesson-34/world_time_app/assets/south_korea.png',
    ),
    WorldTime(
      url: 'Asia/Jakarta',
      location: 'Jakarta',
      flag:
          'https://upload.wikimedia.org/wikipedia/commons/9/9f/Flag_of_Indonesia.svg',
    ),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // Navigate to home screen after fetching time
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Choose a Location", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[900],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Center(child: Text(locations[index].location)),
            ),
          );
        },
      ),
    );
  }
}
