import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xffffffff),
      content: Container(
        height: 400,
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "To-Do",
              style: TextStyle(fontSize: 17, color: Color(0xff838494)),
            ),

            SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: "Enter Task...",
                  hintStyle: TextStyle(fontSize: 18, color: Color(0xff838494)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
