import 'package:flutter/material.dart';
import 'package:demo/util/my_button.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 40, // Set your desired width
                  height: 40, // Set your desired height
                  child: MyButton(
                    text: "✕",
                    style: TextStyle(fontSize: 20),
                    onPressed: () {},
                    backgroundColor: Color(0xffffffff),
                  ),
                ),
              ],
            ),

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

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: MyButton(
                      text: 'Done',
                      onPressed: () {},
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      backgroundColor: Color(0xff0675f3),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
