import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => {Scaffold.of(context).openDrawer()},
              );
            },
          ),
        ),
      ),

      drawer: Drawer(
        child: ListView(children: [ListTile(title: Text("Home"))]),
      ),
    );
  }
}
