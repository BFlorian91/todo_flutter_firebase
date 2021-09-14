import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:todo_firestore/services/database_service.dart';
import 'widgets/loading.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool isComplete = false;
  TextEditingController todoEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        key: UniqueKey(),
                        background: Container(
                          padding: const EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: const Icon(Icons.delete, color: Colors.white),
                          color: Colors.red,
                        ),
                        onDismissed: (direction) {
                          DatabaseService().removeTodo(todos[index].reference);
                        },
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              isComplete = !isComplete;
                              DatabaseService().completeTodo(
                                  todos[index].reference, isComplete);
                            });
                          },
                          leading: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
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
        ),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => SimpleDialog(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              backgroundColor: Colors.grey[700],
              title: Row(
                children: [
                  const Text(
                    "Add Todo",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.cancel,
                      size: 30,
                    ),
                    color: Colors.grey,
                  )
                ],
              ),
              children: [
                TextFormField(
                  controller: todoEditingController,
                  autofocus: true,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    hintText: "eg. meditation",
                    hintStyle: TextStyle(color: Colors.white70),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    child: const Text(
                      "Add",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () async {
                      if (todoEditingController.text.isNotEmpty) {
                        await DatabaseService()
                            .createNewTodo(todoEditingController.text.trim());
                        Navigator.pop(context);
                      }
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
