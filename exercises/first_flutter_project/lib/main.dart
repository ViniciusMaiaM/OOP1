import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
    theme: ThemeData(primarySwatch: Colors.purple),
    home: Scaffold(
        appBar: AppBar(title: Text("Hello World")),
        body: Center(child: Column(children: [])),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Call',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.abc),
              label: 'ABC',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm),
              label: 'Alarm',
            )
          ],
        )),
  );

  runApp(app);
}
