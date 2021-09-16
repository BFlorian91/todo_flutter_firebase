import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class DatabaseService {
  CollectionReference todosCollection =
      FirebaseFirestore.instance.collection('Todos');
  CollectionReference saveTodosCollection =
      FirebaseFirestore.instance.collection('saveTodos');

  var uid = const Uuid();

  Future<Object> setTodo(String title) async {
    return await todosCollection.add({
      'uid': uid.v4(),
      'title': title,
      'isComplete': false,
    });
  }

  Future<Object> saveTodo(String title) async {
    // final date = DateFormat.yMd().add_jm();
    return await saveTodosCollection.add({
      'uid': uid.v4(),
      'title': title,
      'isComplete': true,
      'date': FieldValue.serverTimestamp(),
    });
  }

  Future<void> completeTodo(DocumentReference ref, bool statement) async {
    return await ref.update({'isComplete': statement});
  }

  Future<void> updateTodo(DocumentReference ref, String title) async {
    return await ref.update({'title': title});
  }

  Future<void> removeTodo(DocumentReference ref) async {
    return await ref.delete();
  }

  Stream<QuerySnapshot> listTodos() {
    return todosCollection.snapshots();
  }
}
