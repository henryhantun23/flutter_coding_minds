import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_coding_minds/ColumnDemo.dart';
import 'package:flutter_coding_minds/Screens/FireBaseLogin.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      //backgroundColor: Colors.purple,
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Container(
              child: const Image(
                  image: NetworkImage('https://www.kadencewp.com/wp-content/uploads/2020/10/alogo-4.png'),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin:const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text(
                  'Task + Contact Manager',
                  style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  )
                ),
              ),
            //const Image(
             // image: AssetImage('assets/placeholder-icon-design-free-vector.jpg')
            //),

            //const Text(
              //'You have pushed the button this many times:',
              //style: TextStyle(
              //  fontStyle: FontStyle.italic,
             //   fontWeight: FontWeight.bold,
             //   color: Colors.red,
             // )
            //),
            //Container(
            //  margin:const EdgeInsets.all(10),
             // child: Text(
              //  'Current Clicks: ${_counter*2}',
              //  style: Theme.of(context).textTheme.headlineMedium,
              //    ),
             //   ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text(
                  'Go To Login Page'
              ),
            ),

          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(
       // onPressed: _incrementCounter,
       // tooltip: 'Increment',
      //  child: const Icon(Icons.add),
     // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
