import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coding_minds/Screens/todo_contact_portal.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex:20,
            child: Image(
              image:NetworkImage('https://www.kadencewp.com/wp-content/uploads/2020/10/alogo-4.png'),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
          flex:50,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: const Text(
                      'Login',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right:30),
                  child: TextField(
                    controller: usernameController,
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left:30, right: 30, top: 10, bottom: 10),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top:10, bottom: 20),
                  child: const Text(
                      'Forgot Password?',
                    style: TextStyle(
                      color: Colors.red,
                    )
                  ),
                ),
                Expanded (
                  child: Container(
                    margin: const EdgeInsets.only(top:10, bottom:10),
                    width: 250,
                    child: ElevatedButton(
                        child: const Text('login'),
                        onPressed: () {
                          FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: usernameController.text, password: passwordController.text)
                              .then((value) {
                            print("Successfully Login");
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const TodoContact()),
                            );
                          }) .catchError((error) {
                            print("Login Failed");
                            print(error.toString());
                          });
                        },
                    ),
                  ),
                ),
                Expanded (
                  child: Container(
                    child: TextButton(
                      child: const Text('Register'),
                      onPressed: () {
                        FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: usernameController.text, password: passwordController.text)
                                .then((value) {
                          print("Successfully Registered");
                          print(value.user!.uid);
                        }) .catchError((error) {
                         print("Registration Failed");
                         print(error.toString());
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Expanded(
            //flex:10,
           // child: Row(
           //   mainAxisAlignment: MainAxisAlignment.center,
           //   children: [
            //    const Text('App Logo'),
           //     IconButton(
            //      icon: const Icon(Icons.facebook),
              //    onPressed: () {  },
             //   ),
              //  IconButton(
             //     icon: const Icon(Icons.computer),
              //    onPressed: () {  },
              //  ),
              //],
            //),
         // ),
        ],
      ),
    );
  }
}
