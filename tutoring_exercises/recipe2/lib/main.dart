import 'package:flutter/material.dart';

class NavBarItem {
  final Icon icon;
  final String label;

  NavBarItem({required this.icon, required this.label});
}

class NewNavBar extends StatelessWidget {
  final List<NavBarItem> items;
  final Function(int) onTap;

  const NewNavBar({super.key, required this.items, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      items: items
          .map((item) =>
              BottomNavigationBarItem(icon: item.icon, label: item.label))
          .toList(),
    );
  }
}

void main() {
  MaterialApp app = MaterialApp(
    theme: ThemeData(primarySwatch: Colors.deepPurple),
    home: Scaffold(
      appBar: CustomAppBar(),
      body: const BodyContent(),
      bottomNavigationBar: NewNavBar(
        items: [
          NavBarItem(icon: const Icon(Icons.abc), label: 'Label 1'),
          NavBarItem(icon: const Icon(Icons.ac_unit), label: 'Label 2'),
          NavBarItem(icon: const Icon(Icons.access_alarm), label: 'Label 3'),
          NavBarItem(icon: const Icon(Icons.accessibility), label: 'Label 4'),
        ],
        onTap: (index) {
          print("Tapped on item $index");
        },
      ),
    ),
  );

  runApp(app);
}

class BodyContent extends StatelessWidget {
  const BodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Expanded(
            child: Text("La Fin Du Monde - Bock - 65 ibu"),
          ),
          Expanded(
            child: Text("Sapporo Premiume - Sour Ale - 54 ibu"),
          ),
          Expanded(
            child: Text("Duvel - Pilsner - 82 ibu"),
          )
        ],
      ),
    );
  }
}

class CustomAppBar extends AppBar {
  CustomAppBar({super.key})
      : super(
          title: const Text("Dicas"),
        );
}
