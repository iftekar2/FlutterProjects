import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SizedBox(width: 10),
            CustomSlidableAction(
              onPressed: deleteFunction,
              backgroundColor: const Color.fromARGB(255, 208, 208, 208),

              borderRadius: BorderRadius.circular(12),
              child: Icon(
                Icons.delete,
                size: 30, // Set your desired size here
                color: Colors.black,
              ),
            ),
          ],
        ),

        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.blue,
              ),
              Text(
                taskName,
                style: TextStyle(
                  fontSize: 20,
                  decoration:
                      taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
