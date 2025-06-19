import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    final routeData =
        data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments;

    // Setbackground image based on time of day
    bool isDayTime = data != null && data is Map && data['isDayTime'] == true;
    String image =
        isDayTime
            ? 'https://images.photowall.com/products/44323/sunny-day.jpg?h=699&q=85'
            : 'https://st2.depositphotos.com/2627021/8523/i/450/depositphotos_85236464-stock-photo-romantic-moon-in-starry-night.jpg';

    Color color = isDayTime ? Colors.indigo : Colors.indigo[700]!;

    return Scaffold(
      backgroundColor: color,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(
                    context,
                    '/location',
                  );
                  setState(() {
                    data = {
                      'location': result['location'],
                      'flag': result['flag'],
                      'time': result['time'],
                      'isDayTime': result['isDayTime'],
                    };
                  });
                },
                icon: Icon(Icons.edit_location, color: Colors.white),
                label: Text(
                  "Edit Location",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),

              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data != null && data is Map && data['location'] != null
                        ? data['location']
                        : 'Loading...',
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ),
                ],
              ),

              SizedBox(height: 20.0),
              Text(
                data != null && data is Map && data['time'] != null
                    ? data['time']
                    : 'Time is not found',
                style: TextStyle(fontSize: 50.0, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
