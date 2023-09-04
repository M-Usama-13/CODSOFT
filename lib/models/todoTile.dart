import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? delTask;

  const ToDoTile({
  Key? key,
  required this.taskName,
  required this.taskCompleted,
  required this.onChanged,
  required this.delTask,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: delTask,
            icon: Icons.delete,
            backgroundColor: Colors.redAccent.shade200,
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.only(left: 23,right: 23,top: 23),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          gradient: const LinearGradient(
            colors: [Color(0xff96e6a1),Color(0xffd4fc79)],
            stops: [0.66,1.0]
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(taskName,
            style: TextStyle(
              fontSize: 20,
              decoration: taskCompleted
                  ?TextDecoration.lineThrough
                  :TextDecoration.none
            ),
            ),
            Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.white,
              checkColor: Colors.black12,
                side: const BorderSide(color: Color(0xff585858)),
              ),
          ],
        ),
      ),
    );
  }
}
