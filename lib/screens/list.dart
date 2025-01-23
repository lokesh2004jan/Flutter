import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key, 
    required this.taskName,
    required this.taskCompleted,
    this.onChanged,
    required this.deleteTask
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteTask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 30,
        bottom: 1,
      ),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(),
            children: [
              SlidableAction(onPressed: deleteTask,icon: Icons.delete,
                borderRadius: BorderRadius.circular(23),)
            ]
        ),
        child: Container(
          decoration: BoxDecoration(
        
            color: Colors.deepPurple[600],
            borderRadius: BorderRadius.circular(21)
              ,boxShadow: [BoxShadow(offset: Offset(0, 4),
              color: Colors.black87
              ,blurRadius: 5)],
          ),
          padding: EdgeInsets.all(21),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                checkColor: Colors.white,
                activeColor: Colors.deepPurple,
        
                side: BorderSide(width: 1,color: Colors.white),
        
              ),
              Text(
                taskName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  decoration:taskCompleted?
                  TextDecoration.lineThrough
                      :TextDecoration.none,
                  decorationColor: Colors.white,decorationThickness: 2
        
        
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}