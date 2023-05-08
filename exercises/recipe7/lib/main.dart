import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

class DataService {
  final ValueNotifier<List> tableStateNotifier;
  final ValueNotifier<List<String>> columnNamesNotifier;
  final ValueNotifier<List<String>> propertyNamesNotifier;

  int _bodySize = 5;

  DataService()
      : tableStateNotifier = ValueNotifier([
          {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
          {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
          {"name": "Duvel", "style": "Pilsner", "ibu": "82"},
          {"name": "Maharaj", "style": "Rolling Rock", "ibu": "19"},
          {"name": "Edmund Fitzgerald Porter", "style": "Sierra Nevada", "ibu": "49"}
        ]),
        columnNamesNotifier = ValueNotifier(["Name", "Style", "IBU"]),
        propertyNamesNotifier =
            ValueNotifier(["name", "style", "ibu"]);

  void load(index) {
    switch (index) {
      case 1:
        loadCoffees();
        break;
      case 2:
        loadBeers();
        break;
      case 3:
        loadNations();
        break;
    }
  }

  Future<void> loadBeers() async {
    var beersUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/beer/random_beer',
        queryParameters: {'size': '$_bodySize'});

    var jsonString = await http.read(beersUri);

    var beersJson = jsonDecode(jsonString);

    propertyNamesNotifier.value = ["name", "brand", "ibu"];
    columnNamesNotifier.value = ["Name", "Brand", "IBU"];
    tableStateNotifier.value = beersJson;
  }

  Future<void> loadCoffees() async {
    var coffeesUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/coffee/random_coffee',
        queryParameters: {'size': '$_bodySize'});

    var jsonString = await http.read(coffeesUri);

    var coffeesJson = jsonDecode(jsonString);

    propertyNamesNotifier.value = ["blend_name", "origin", "variety"];
    columnNamesNotifier.value = ["Blend Name", "Origin", "Variety"];
    tableStateNotifier.value = coffeesJson;
  }

  Future<void> loadNations() async {
    var nationsUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/nation/random_nation',
        queryParameters: {'size': '$_bodySize'});

    var jsonString = await http.read(nationsUri);

    var nationsJson = jsonDecode(jsonString);

    columnNamesNotifier.value = ["Nationality", "Language", "Capital"];
    propertyNamesNotifier.value = ["nationality", "language", "capital"];
    tableStateNotifier.value = nationsJson;
  }

  void setBodySize(int bodySize) {
    _bodySize = bodySize;
    load(2);
  }
}

final dataService = DataService();

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
            actions: [
              PopupMenuButton<int>(
                  onSelected: (int newSize) {
                    dataService.setBodySize(newSize);
                  },
                  itemBuilder: (BuildContext context) => const [
                        PopupMenuItem<int>(
                          value: 5,
                          child: Text('Body size: 5'),
                        ),
                        PopupMenuItem<int>(
                          value: 10,
                          child: Text('Body size: 10'),
                        ),
                        PopupMenuItem<int>(
                          value: 15,
                          child: Text('Body size: 15'),
                        ),
                      ]),
            ],
          ),
          body: ValueListenableBuilder(
              valueListenable: dataService.tableStateNotifier,
              builder: (_, value, __) {
                return DataTableWidget(jsonObjects: value);
              }),
          bottomNavigationBar: NewNavBar(itemSelectedCallback: (index) {
            dataService.load(index + 1);
          }),
        ));
  }
}

class NewNavBar extends HookWidget {
  final _itemSelectedCallback;

  NewNavBar({itemSelectedCallback})
      : _itemSelectedCallback = itemSelectedCallback ?? (int) {}

  @override
  Widget build(BuildContext context) {
    var state = useState(1);

    return BottomNavigationBar(
        onTap: (index) {
          state.value = index;

          _itemSelectedCallback(index);
        },
        currentIndex: state.value,
        items: const [
          BottomNavigationBarItem(
            label: "Coffes",
            icon: Icon(Icons.coffee_outlined),
          ),
          BottomNavigationBarItem(
              label: "Beers", icon: Icon(Icons.local_drink_outlined)),
          BottomNavigationBarItem(
              label: "Nations", icon: Icon(Icons.flag_outlined))
        ]);
  }
}

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;

  DataTableWidget({required this.jsonObjects});

  @override
  Widget build(BuildContext context) {
    final columnNames = dataService.columnNamesNotifier.value;
    final propertyNames = dataService.propertyNamesNotifier.value;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
          columns: columnNames
              .map((name) => DataColumn(
                  label: Expanded(
                      child: Text(name,
                          style: TextStyle(fontStyle: FontStyle.italic)))))
              .toList(),
          rows: jsonObjects
              .map((obj) => DataRow(
                  cells: propertyNames
                      .map((propName) => DataCell(Text(obj[propName])))
                      .toList()))
              .toList()),
    );
  }
}
