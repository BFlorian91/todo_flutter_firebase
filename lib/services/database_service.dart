import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class DatabaseService {
  CollectionReference todosCollection =
      FirebaseFirestore.instance.collection('Todos');

  var uid = const Uuid();

  Future<Object> createNewTodo(String title) async {
    return await todosCollection.add({
      'uid': uid.v4(),
      'title': title,
      'isComplete': false,
    });
  }

  Future<void> completeTodo(DocumentReference ref, bool statement) async {
    return await ref.update({'isComplete': statement});
  }

  Future<void> removeTodo(DocumentReference ref) async {
    return await ref.delete();
  }

  Stream<QuerySnapshot> listTodos() {
    return todosCollection.snapshots();
  }
}
