import 'package:flutter/material.dart';

import 'package:todo_firestore/services/database_service.dart';

class DialogAdd extends StatelessWidget {
  final TextEditingController todoEditingController = TextEditingController();

  DialogAdd({Key? key}) : super(key: key);
  
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
            onPressed: () async {
              if (todoEditingController.text.isNotEmpty) {
                await DatabaseService()
                    .setTodo(todoEditingController.text.trim());
                Navigator.pop(context);
              }
            },
          ),
        )
      ],
    );
  }
}
