import 'package:flutter/material.dart';

import 'list.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
final _Controller =TextEditingController();
class _HomeState extends State<Home> {
  // Add items list as class member
  final List<dynamic> items = [
    ["DSA", false],
    ["Flutter Project", true],
    ["submission", true]
  ];

  void checkBoxChanged(int index) {
    setState(() {
      items[index][1] = !items[index][1];
    });
  }
void saveTask(){
    setState(() {
      items.add([_Controller.text,false]);
      _Controller.clear();
    });
}
void delete(int index){
    setState(() {
      items.removeAt(index);
    });

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "To Do List",
          style: TextStyle(color: Colors.white, fontSize: 23),
        ),
        backgroundColor: Colors.deepPurple[600],
        centerTitle: true,
        scrolledUnderElevation: 2,
        elevation: 4,
        shadowColor: Colors.black,
      ),
      backgroundColor: Colors.deepPurple[300],
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, index) {
          return TodoList(
            taskName: items[index][0],
            taskCompleted: items[index][1],
            onChanged: (value) => checkBoxChanged(index),
            deleteTask: (value)=> delete(index),
          );
        },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(child:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: TextField(
              controller: _Controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.deepPurple[200],
                hintText: "Add Tasks",
                hintStyle: TextStyle(color: Colors.deepPurple,fontSize: 13),
                enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(23),
                borderSide: BorderSide(color: Colors.deepPurple,width: 1.5)
                ),
                  focusedBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(23),
                      borderSide: BorderSide(color: Colors.deepPurple,width: 1.5)
                  )

              ),
            ),
          ),
          ),
          FloatingActionButton(onPressed: saveTask,
            child: Icon(Icons.add),elevation: 4,)
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}