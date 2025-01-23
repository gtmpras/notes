import 'package:flutter/material.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/widgets/note_card.dart';

import 'create_note_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return NoteCard(note: notes[index], index: index, onNoteDeleted: onNoteDeleted);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Add Note clicked!")),
          );
          Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateNotePage(onNewNoteCreated: onNoteCreated,)));        },
      ),
    );
  }
  void onNoteCreated(Note note){
    notes.add(note);
    setState(() {
      
    });
  }

  void onNoteDeleted(int index){
    notes.removeAt(index);
    setState(() {
      
    });
  }
}
