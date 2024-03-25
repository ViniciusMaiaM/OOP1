import 'package:flutter/material.dart';

var dataObjects = [
  {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
  {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
  {"name": "Duvel", "style": "Pilsner", "ibu": "82"},
  {"name": "Brahma", "style": "lorem", "ibu": "10"},
  {"name": "Antartica", "style": "lorem", "ibu": "20"},
  {"name": "Spaten", "style": "lorem", "ibu": "30"},
  {"name": "Amstel", "style": "lorem", "ibu": "40"},
  {"name": "Corona", "style": "lorem", "ibu": "50"},
  {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
  {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
  {"name": "Duvel", "style": "Pilsner", "ibu": "82"},
  {"name": "Brahma", "style": "lorem", "ibu": "10"},
  {"name": "Antartica", "style": "lorem", "ibu": "20"},
  {"name": "Spaten", "style": "lorem", "ibu": "30"},
  {"name": "Amstel", "style": "lorem", "ibu": "40"},
  {"name": "Corona", "style": "lorem", "ibu": "50"},
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cervejas',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Roboto'),
        ),
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
          objects: dataObjects,
          propertyNames: const ['name', 'style', 'ibu'],
          columnNames: const ['Name', 'Style', 'Ibu']),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List objects;
  List propertyNames;
  List columnNames;

  MyHomePage(
      {super.key,
      this.objects = const [],
      this.propertyNames = const [],
      this.columnNames = const []});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cervejas"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            objects.length,
            (index) => ExpansionTile(
              title: Text(objects[index][propertyNames[0]]),
              subtitle: const Text('Beer'),
              children: [
                ListTile(
                  title: Text("Style: ${objects[index][propertyNames[1]]}"),
                ),
                ListTile(
                  title: Text("IBU: ${objects[index][propertyNames[2]]}"),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const NewNavBar(),
    );
  }
}

class NewNavBar extends StatelessWidget {
  const NewNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text("Botão 1"),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.star),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Botão 2"),
          ),
        ],
      ),
    );
  }
}
