import 'package:flutter/material.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Meu app")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Apenas começando...",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text("No meio..."),
              const Text("Terminando..."),
              FadeInImage.assetNetwork(
                placeholder: 'assets/placeholder.jpg',
                image: 'https://picsum.photos/250?image=4',
                fit: BoxFit.cover,
                width: 250,
                height: 250,
              ),
            ],
          ),
        ));
  }
}

class NewNavBar extends StatelessWidget {
  List<Icon> icons;
  NewNavBar({super.key, this.icons = const []});

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
