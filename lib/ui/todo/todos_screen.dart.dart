import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:todo_firestore/services/database_service.dart';
import 'package:todo_firestore/widgets/dialog_add.dart';
import 'package:todo_firestore/widgets/dialog_update.dart';
import 'package:todo_firestore/widgets/nav_drawer.dart';
import '../../widgets/loading.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  bool isComplete = false;
  int numberOfTasksComplete = 0;
  TextEditingController todoEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text('Task Manager'),
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: DatabaseService().listTodos(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Loading();
            }
            final todos = snapshot.data!.docs;

            return Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "All Todos",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Text(
                      "0 / ${todos.length}",
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 20),
                  ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      color: Colors.green[800],
                    ),
                    itemCount: todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        confirmDismiss: (DismissDirection direction) async {
                          return await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return direction == DismissDirection.endToStart
                                  ? AlertDialog(
                                      title: const Text("Delete Confirmation"),
                                      content: const Text(
                                          "Are you sure you want to delete this item?"),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(true),
                                          child: const Text(
                                            "Delete",
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                          child: const Text(
                                            "Cancel",
                                          ),
                                        ),
                                      ],
                                    )
                                  : AlertDialog(
                                      title: const Text("Save Confirmation"),
                                      content: const Text(
                                          "Are you sure you have complete this task?"),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(true),
                                          child: const Text(
                                            "Done",
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                          child: const Text(
                                            "Cancel",
                                          ),
                                        ),
                                      ],
                                    );
                            },
                          );
                        },
                        key: UniqueKey(),
                        background: Container(
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              children: const [
                                Icon(Icons.favorite, color: Colors.white),
                                SizedBox(width: 10),
                                Text('Done',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                        secondaryBackground: Container(
                          color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text('Move to trash',
                                    style: TextStyle(color: Colors.white)),
                                SizedBox(width: 10),
                                Icon(Icons.delete, color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                        onDismissed: (DismissDirection direction) {
                          if (direction == DismissDirection.startToEnd) {
                            DatabaseService().saveTodo(todos[index]['title']);
                          }
                          DatabaseService().removeTodo(todos[index].reference);
                        },
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              isComplete = !isComplete;
                            });
                            DatabaseService().completeTodo(
                                todos[index].reference, isComplete);
                            // print("${todos[index]['title']} is: ${todos[index]['isComplete']}");
                            // if (!todos[index]['isComplete']) {
                            //   numberOfTasksComplete++;
                            // }
                            // if (todos[index]['isComplete']) {
                            //   numberOfTasksComplete--;
                            // }
                          },
                          onLongPress: () => DialogUpdate(
                            ref: todos[index].reference,
                          ),
                          leading: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                            child: todos[index]['isComplete']
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  )
                                : Container(),
                          ),
                          title: Text(
                            todos[index]['title'],
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 25,
          color: Colors.white,
        ),
        onPressed: () {
          showDialog(context: context, builder: (context) => DialogAdd());
        },
      ),
    );
  }
}
