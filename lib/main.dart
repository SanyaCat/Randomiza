import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(Randomiza());

class Randomiza extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Randomiza',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _number;
  final minController = TextEditingController();
  final maxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Glory to the God of Random'),
      ),
      body: Column(
        children: [
          Text(_number != null ? '$_number' : ''),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'min',
                    labelText: 'min',
                  ),
                  controller: minController,
                ),
              ),
              SizedBox(
                width: 100,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'max',
                    labelText: 'max',
                  ),
                  controller: maxController,
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Random random = new Random();
          int min = int.parse(minController.text);
          int max = int.parse(maxController.text);
          if (max < min) {
            int mem = max;
            max = min;
            min = mem;
          }
          setState(() {
            _number = random.nextInt(max - min + 1) + min;
          });
        },
        tooltip: 'Randomize',
        child: Icon(Icons.edit),
      ),
    );
  }
}
