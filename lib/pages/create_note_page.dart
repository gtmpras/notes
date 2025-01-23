import 'package:flutter/material.dart';
import 'package:notes/models/note_model.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({super.key, required this.onNewNoteCreated});

  final Function(Note) onNewNoteCreated;

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: const TextStyle(
                fontSize: 28,
              ),
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Title"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: bodyController,
              style: const TextStyle(
                fontSize: 18,
              ),
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Your Story"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (titleController.text.isEmpty) {
            return;
          }
          if (bodyController.text.isEmpty) {
            return;
          }
          final note =
              Note(body: bodyController.text, title: titleController.text);
       
          widget.onNewNoteCreated(note);
          Navigator.of(context).pop();
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
