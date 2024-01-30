import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coding_minds/Screens/todo_contact_portal.dart';

class addContactPage extends StatefulWidget {
  const addContactPage({super.key});

  @override
  State<addContactPage> createState() => _addContactPageState();
}

class _addContactPageState extends State<addContactPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  var contactList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Input Page"),
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
                      controller: nameController,
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                      ),
                    ),
                  ),
                  Container(
                    child: TextField(
                      controller: phoneNumberController,
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number',
                      ),
                    ),
                  ),
              
                  Container(
                    child: ElevatedButton(
                        child: const Text('Add Contact'),
                        onPressed: () {
                          FirebaseFirestore.instance.collection("ToDo_Contacts").add({
                            "Name": nameController.text,
                            "Phone": phoneNumberController.text,
                          }
                          ).then((value){
                            print("Successfully Added Contact");
              
                          }).catchError((error){
                            print("Failed to add");
                            print(error);
                          });
                      }
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      child: const Text('List Contacts'),
                      onPressed: () {
                       contactList = [];
                       FirebaseFirestore.instance.collection("ToDo_Contacts").get()
                           .then((querySnapShot){
                             print("Successfully Loaded Contacts");
                             //print(querySnapShot);
                             querySnapShot.docs.forEach((element){
                               print(element.data());
              
                               contactList.add(element.data());
                             });
                             setState(() {
              
                             });
                        }).catchError((error){
                          print("Failed to Load Contacts");
                          print(error);
              
                       });
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8), 
                      itemCount: contactList.length,
                      itemBuilder: (context, index) {
                       return Container(
                        height: 50,
                        color: Colors.purple[100],
                        child: Center(child: Text('${contactList[index]}'),)
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
