import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_firestore/services/database_service.dart';

class DialogUpdate extends StatefulWidget {
  final DocumentReference ref;
  final TextEditingController todoEditingController = TextEditingController();

  DialogUpdate({required this.ref, Key? key}) : super(key: key);

  @override
  _DialogUpdateState createState() => _DialogUpdateState();
}

class _DialogUpdateState extends State<DialogUpdate> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
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
          controller: widget.todoEditingController,
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
              "Update",
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
              if (widget.todoEditingController.text.isNotEmpty) {
                await DatabaseService().updateTodo(
                    widget.ref, widget.todoEditingController.text.trim());
                Navigator.pop(context);
              }
            },
          ),
        )
      ],
    );
  }
}
