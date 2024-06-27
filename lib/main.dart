import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter IOT Sample',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),

      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool on = false;
  final dbF = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 13, 18, 19),
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: const Text("Iot Project"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              on
                  ? const Icon(
                      Icons.lightbulb,
                      size: 100,
                      color: Colors.amber,
                    )
                  : const Icon(
                      Icons.lightbulb_outline_sharp,
                      size: 100,
                      color: Colors.white,
                    ),
              ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: on ? Colors.green : Colors.white),
                onPressed: () {
                  dbF.child("Light").set({"switch": !on});
                  setState(() {
                    on = !on;
                  });
                },
                child: on ? const Text("Turn On") : const Text("Turn Off"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
