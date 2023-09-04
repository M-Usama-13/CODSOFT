import 'package:flutter/material.dart';
import 'package:to_do_list/models/dialuge_box.dart';
import 'package:to_do_list/models/todoTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todoTile = [
    ['Meet the Hr ar 11 am', true],
    ['Dinner at Sohu restaurant', false],
  ];
  final TextEditingController _controller = TextEditingController();
// function to change checkbox state
  void checkBoxChanged(int index) {
    setState(() {
      todoTile[index][1] = !todoTile[index][1];
    });
  }

  //function to save task dialogue
  void saveTask() {
    setState(() {
      todoTile.add([_controller.text, false]);
    });
    _controller.clear();
    Navigator.of(context).pop();
  }

  // function to create a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return TileDialogueBox(
              controller: _controller,
              onSave: saveTask,
              onCancel: () => Navigator.of(context).pop());
        });
  }

  // Delete Task function
  void deleteTask(int index) {
    setState(() {
      todoTile.removeAt(index);
    });
    print(todoTile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'To Do List',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            gradient: const LinearGradient(
                colors: [Color(0xff96e6a1), Color(0xffd4fc79)],
                stops: [0.66, 1.0]),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: todoTile.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: todoTile[index][0],
            taskCompleted: todoTile[index][1],
            onChanged: (value) => checkBoxChanged(index),
            delTask: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: Material(
          type: MaterialType.transparency,
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white38, width: 3.0),
              gradient: const LinearGradient(
                  colors: [Color(0xff96e6a1),Color(0xffd4fc79)],
                  stops: [0.5,1.0]
              ),
              shape: BoxShape.circle,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(500.0),
              onTap: createNewTask,
              child: const Icon(
                Icons.add,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      // Container(
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(13),
      //     gradient: const LinearGradient(
      //         colors: [Color(0xff96e6a1),Color(0xffd4fc79)],
      //         stops: [0.6,1.0]
      //     ),
      //   ),
      //   child: FloatingActionButton(
      //     backgroundColor: Colors.transparent,
      //     shape: BeveledRectangleBorder(
      //         borderRadius: BorderRadius.circular(13)
      //     ),
      //     onPressed: createNewTask,
      //     child: const Icon(
      //       Icons.add,
      //       color: Colors.white,
      //       size: 50,
      //     ),
      //   ),
      // ),
    );
  }
}
