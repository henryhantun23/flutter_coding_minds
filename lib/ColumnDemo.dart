import 'package:flutter/material.dart';

class ColumnDemo extends StatefulWidget {
  const ColumnDemo({super.key});

  @override
  State<ColumnDemo> createState() => _ColumnDemoState();
}

class _ColumnDemoState extends State<ColumnDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column Demo')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 25,
              child: Text('Title1'),
            ),
            Expanded(
              flex: 25,
              child: Container(
                  //alignment: Alignment.center,
                  child: Text('Title2')
              ),
            ),
            Expanded(
              flex: 25,
              child: ElevatedButton(
                child: Text('Login'),
                onPressed: (){

                },
              ),
            ),
            Expanded(
              flex: 25,
              child: ElevatedButton(
                child: Text('Signup'),
                onPressed: (){

                },
              ),
            ),

          ],
        ),

        ),
    );

  }
}
