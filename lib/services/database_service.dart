import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_firestore/models/todo.dart';

class DatabaseService {
  CollectionReference todosCollection =
      FirebaseFirestore.instance.collection("Todos");

  Future createNewTodo(String title) async {
    return await todosCollection.add({"title": title, "isComplete": false});
  }

  Future completeTodo(String uid) async {
    return await todosCollection.doc(uid).update({"isComplete": true});
  }

  // List<Todo> todofromFirestore(QuerySnapshot snapshot) {
  //   return snapshot.docs
  //       .map(
  //         (e) => Todo(
  //           uid: (e.data() as dynamic)["uid"],
  //           title: (e.data() as dynamic)["title"],
  //           isComplete: (e.data() as dynamic)["isComplete"],
  //         ),
  //       )
  //       .toList();
  // }

  Stream<QuerySnapshot> listTodos() {
    return FirebaseFirestore.instance.collection('Todos').snapshots();
  }
}
