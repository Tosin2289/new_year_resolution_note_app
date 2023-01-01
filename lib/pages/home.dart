import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:new_year_resolution/data/database.dart';
import 'package:new_year_resolution/utils/dialog_box.dart';
import 'package:new_year_resolution/utils/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final mybox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();
  @override
  void initState() {
    // TODO: implement initState
    if (mybox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final control = TextEditingController();

  void checkboxchanged(bool? value, int index) {
    setState(() {
      db.toDOList[index][1] = !db.toDOList[index][1];
    });
    db.updateDataBase();
  }

//save new task
  void saveNewTask() {
    setState(() {
      db.toDOList.add([control.text, false]);
      control.clear();
    });
    Navigator.of(context).pop();
  }

  void CreateNewTask() {
    showDialog(
        context: context,
        builder: ((context) {
          return DialogBox(
            controller: control,
            onsave: saveNewTask,
            oncancle: () => Navigator.of(context).pop(),
          );
        }));
  }

  //delete tile
  void deleteTask(int index) {
    setState(() {
      db.toDOList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: SizedBox(
          height: 190,
          child: Lottie.asset(
            'assets/2023.json',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[500],
        onPressed: CreateNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return TodoTile(
            taskname: db.toDOList[index][0],
            taskcomplete: db.toDOList[index][1],
            onChanged: (value) => checkboxchanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        }),
        itemCount: db.toDOList.length,
      ),
    );
  }
}
