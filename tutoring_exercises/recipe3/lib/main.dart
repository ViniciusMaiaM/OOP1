import 'package:flutter/material.dart';

void main() {
  MyApp app = const MyApp();

  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: MyAppBar(),
          body: DataBodyWidget(objects: const [
            "La Fin Du Monde - Bock - 65 ibu",
            "Sapporo Premiume - Sour Ale - 54 ibu",
            "Duvel - Pilsner - 82 ibu"
          ]),
          bottomNavigationBar: NewNavBar(
            items: [
              NavBarItem(icon: const Icon(Icons.abc), label: 'Label 1'),
              NavBarItem(icon: const Icon(Icons.ac_unit), label: 'Label 2'),
              NavBarItem(
                  icon: const Icon(Icons.access_alarm), label: 'Label 3'),
            ],
            onTap: (index) {
              print("Tapped on item $index");
            },
          ),
        ));
  }
}

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

class DataBodyWidget extends StatelessWidget {
  List<String> objects;

  DataBodyWidget({super.key, this.objects = const []});

  Expanded processarUmElemento(String obj) {
    return Expanded(
      child: Center(child: Text(obj)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: objects
            .map((obj) => Expanded(
                  child: Center(child: Text(obj)),
                ))
            .toList());
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Colors? selected;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Dicas"),
      actions: [
        PopupMenuButton(
            onSelected: (value) {
              // TODO: Later add the color change functionality
            },
            itemBuilder: (context) => const [
                  PopupMenuItem(
                    value: Colors.black,
                    child: Text("Black"),
                  ),
                  PopupMenuItem(
                    value: Colors.amber,
                    child: Text("Amber"),
                  ),
                  PopupMenuItem(
                    value: Colors.cyan,
                    child: Text("Cyan"),
                  ),
                ])
      ],
    );
  }
}
