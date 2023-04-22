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
  MyApp app = MyApp();

  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Dicas"),
          ),
          body: MytileWidget(
              objects: dataObjects, propertyNames: ['Style', 'Ibu']),
          bottomNavigationBar: NewNavBar(),
        ));
  }
}

class NewNavBar extends StatelessWidget {
  NewNavBar();

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(onTap: botaoFoiTocado, items: const [
      BottomNavigationBarItem(
        label: "Cafés",
        icon: Icon(Icons.coffee_outlined),
      ),
      BottomNavigationBarItem(
          label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
      BottomNavigationBarItem(label: "Nações", icon: Icon(Icons.flag_outlined))
    ]);
  }
}

class DataBodyWidget extends StatelessWidget {
  List objects;
  List propertyNames;
  List collumnNames;

  DataBodyWidget(
      {this.objects = const [],
      this.propertyNames = const [],
      this.collumnNames = const []});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DataTable(
            columns: collumnNames
                .map((name) => DataColumn(
                    label: Expanded(
                        child: Text(name,
                            style: TextStyle(fontStyle: FontStyle.italic)))))
                .toList(),
            rows: objects
                .map((obj) => DataRow(
                    cells: propertyNames
                        .map((propName) => DataCell(Text(obj[propName])))
                        .toList()))
                .toList())
      ],
    );
  }
}

class MytileWidget extends StatelessWidget {
  List objects;
  List propertyNames;

  MytileWidget({this.objects = const [], this.propertyNames = const []});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: objects.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(objects[index]["name"]),
              subtitle: Text(
                  "${propertyNames[0]}: ${objects[index]["style"]}, IBU: ${objects[1]["ibu"]}"),
            ),
          );
        });
  }
}
