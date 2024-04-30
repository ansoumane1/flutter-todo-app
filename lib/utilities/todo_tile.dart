import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_slidable/flutter_slidable.dart";

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskcompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskcompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    final textDecoration =
        taskcompleted ? TextDecoration.lineThrough : TextDecoration.none;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.redAccent,
          ),
        ]),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              Checkbox(
                  value: taskcompleted,
                  onChanged: onChanged,
                  activeColor: Colors.black),
              Text(
                taskName,
                style: TextStyle(decoration: textDecoration),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
