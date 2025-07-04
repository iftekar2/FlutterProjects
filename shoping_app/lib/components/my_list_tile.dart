import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;

  const MyListTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 90),
      child: ListTile(
        leading: Icon(icon, color: Colors.black, size: 30),
        title: Text(text, style: TextStyle(fontSize: 20)),
        onTap: onTap,
      ),
    );
  }
}
