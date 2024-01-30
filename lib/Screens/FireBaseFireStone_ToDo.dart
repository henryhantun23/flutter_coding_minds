import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coding_minds/Screens/todo_contact_portal.dart';

class toDo extends StatefulWidget {
  const toDo({super.key});

  @override
  State<toDo> createState() => _toDoState();
}

class _toDoState extends State<toDo> {
  TextEditingController taskController = TextEditingController();
  TextEditingController dueByController = TextEditingController();

  var toDoList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To do List Page"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    child: TextField(
                      controller: taskController,
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Task Name',
                      ),
                    ),
                  ),
                  Container(
                    child: TextField(
                      controller: dueByController,
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Task is due by',
                      ),
                    ),
                  ),

                  Container(
                    child: ElevatedButton(
                        child: const Text('Add Task'),
                        onPressed: () {
                          FirebaseFirestore.instance.collection("ToDo_list").add({
                            "Task": taskController.text,
                            "Task is due by": dueByController.text,
                          }
                          ).then((value){
                            print("Successfully Added task");

                          }).catchError((error){
                            print("Failed to add task");
                            print(error);
                          });
                        }
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      child: const Text('List Task'),
                      onPressed: () {
                        toDoList = [];
                        FirebaseFirestore.instance.collection("ToDo_list").get()
                            .then((querySnapShot){
                          print("Successfully Loaded Contacts");
                          print(querySnapShot);
                          querySnapShot.docs.forEach((element){
                            print(element.data());

                            toDoList.add(element.data());
                          });
                          setState(() {

                          });
                        }).catchError((error){
                          print("Failed to Load Tasks");
                          print(error);

                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: toDoList.length,
                      itemBuilder: (context, index) {
                        return Container(
                            height: 50,
                            color: Colors.purple[100],
                            child: Center(child: Text('${toDoList[index]}'),)
                        );
                      },
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}