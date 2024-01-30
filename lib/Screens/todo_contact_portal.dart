import 'package:flutter/material.dart';
import 'package:flutter_coding_minds/Screens/FireBaseFireStone_Contacts.dart';
import 'package:flutter_coding_minds/Screens/FireBaseFireStone_ToDo.dart';
import 'package:flutter_coding_minds/Screens/FireBaseLogin.dart';
import 'package:flutter_coding_minds/main.dart';

class TodoContact extends StatefulWidget {
  const TodoContact({super.key});

  @override
  State<TodoContact> createState() => _TodoContactState();
}

class _TodoContactState extends State<TodoContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            Expanded (
              child: Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: const Text('Go to To-Do List'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const toDo()));

                  },
                ),
              ),
            ),
            Expanded (
              child: Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: const Text('Go to Contact Info'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const addContactPage()));
                  },
                ),
              ),
            ),
            Expanded (
              child: Container(
                alignment: Alignment.center,
                child: TextButton(
                  child: const Text('Signout'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                ),
              ),
            ),
          ]
      ),

    );
  }
}
