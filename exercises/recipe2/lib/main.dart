import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: const NewAppBar(),
        body: const NewArticle(),
        bottomNavigationBar: NewNavBar(icons: const [
          Icon(Icons.abc),
          Icon(Icons.ac_unit),
          Icon(Icons.access_alarm),
          Icon(Icons.accessibility)
        ]),
      ));

  runApp(app);
}

class NewNavBar extends StatelessWidget {
  List<Icon> icons;
  NewNavBar({super.key, this.icons = const []});

  void touchedButton(int index) {
    print("Touched: $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: touchedButton,
        items: icons
            .map((e) => BottomNavigationBarItem(icon: e, label: "Teste"))
            .toList());
  }
}

class NewArticle extends StatelessWidget {
  const NewArticle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
        ]));
  }
}

class NewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Dicas"),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
