// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps, unused_local_variable

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      title: "Comparison",
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController firstnumbercontroller = TextEditingController();
  final TextEditingController secondnumbercontroller = TextEditingController();

  String mycomparision = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comparison'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Enter 2 numbers for comparison'),
            SizedBox(height: 10),
            TextField(
              controller: firstnumbercontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter your first number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: secondnumbercontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter your second number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  mycomparision = compare();
                });
              },
              child: Text('Compare'),
            ),
            SizedBox(height: 20),
            Text(
              mycomparision,
              style: TextStyle(
                fontSize: 18,
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String compare() {
    var mynum1 = double.tryParse(firstnumbercontroller.text);
    var mynum2 = double.tryParse(secondnumbercontroller.text);

    if (mynum1 == null || mynum2 == null) {
      return 'Please enter valid numbers.';
    }

    if (mynum1 > mynum2) {
      return 'First number is greater';
    } else if (mynum1 < mynum2) {
      return 'Second number is greater';
    } else {
      return 'Both numbers are equal';
    }
  }
}
