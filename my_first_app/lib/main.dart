import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() => runApp(Myapp());

class Myapp extends StatefulWidget {
  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  int level = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text(
            "ID Card",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.grey[850],
          elevation: 0.0,
        ),

        body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2024/05/26/10/15/bird-8788491_1280.jpg",
                  ),
                  radius: 30.0,
                ),
              ),

              Divider(height: 60.0, color: Colors.grey[700]),
              Text("Name", style: TextStyle(color: Colors.grey)),

              SizedBox(height: 10.0),
              Text(
                "John Doe",
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 30.0),
              Text("Current Level", style: TextStyle(color: Colors.grey)),

              SizedBox(height: 10.0),
              Text(
                "$level",
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 30.0),
              Row(
                children: <Widget>[
                  Icon(Icons.email, color: Colors.grey[400]),

                  SizedBox(width: 10.0),
                  Text(
                    "JohnDoe@gmail.com",
                    style: TextStyle(
                      color: Colors.amberAccent,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() => ({level += 1}));
          },
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.grey[800],
        ),
      ),
    );
  }
}
