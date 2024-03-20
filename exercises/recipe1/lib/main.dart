import 'package:flutter/material.dart';

const paragraphStyle = TextStyle(fontSize: 20, height: 1.5);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Center(child: (BaseBody())),
    const Center(child: (FeaturesSection())),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NestJs"),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: buildNavBar(),
    );
  }

  Widget buildNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: Colors.red, // set the selected item color here
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'About',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_tree),
          label: 'Perfil',
        ),
      ],
      onTap: _onItemTapped,
    );
  }
}

class BaseBody extends StatelessWidget {
  const BaseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 150,
              height: 150,
              child: FadeInImage(
                placeholder: NetworkImage(
                    'https://www.vectorlogo.zone/logos/nestjs/nestjs-ar21.png'),
                image: NetworkImage(
                    'https://www.vectorlogo.zone/logos/nestjs/nestjs-ar21.png'),
              )),
          SizedBox(
            height: 150,
            width: 1000,
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Olá, nest! Um framework Node.js progressivo para um desenvolvimento eficiente, confiavel e escalavel para aplicações do lado do servidor',
                  textAlign: TextAlign.center,
                  style: paragraphStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Icon(Icons.extension, color: Colors.red, size: 40),
              SizedBox(width: 8),
              Text(
                'EXTENSIBLE',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 24), // add space between first and second column
          Text(
            'Gives you true flexibility by allowing use of any other libraries thanks to modular architecture.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 32), // add space between second and third column
          Column(
            children: [
              Icon(Icons.layers, color: Colors.red, size: 40),
              SizedBox(width: 8),
              Text(
                'VERSATILE',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 24), // add space between second and third column
          Text(
            'An adaptable ecosystem that is a fully-fledged backbone for all kinds of server-side applications.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 32), // add space between third and fourth column
          Column(
            children: [
              Icon(Icons.sync, color: Colors.red, size: 40),
              SizedBox(width: 8),
              Text(
                'PROGRESSIVE',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 24), // add space between third and fourth column
          Text(
            'Takes advantage of latest JavaScript features, bringing design patterns and mature solutions to Node.js world.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
