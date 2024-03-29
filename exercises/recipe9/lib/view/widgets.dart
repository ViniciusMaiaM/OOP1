import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

import '../data/data_service.dart';

const listNumbers = [3, 7, 17];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void handlePreviousState() {
    dataService.changeAtualState();
  }

  void handleSearch(String search) {
    var state = Map<String, dynamic>.from(dataService.tableStateNotifier.value);
    state['dataObjects'] = dataService.filterCurrentState(search);
    dataService.tableStateNotifier.value = state;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: MyAppBar(
              callback: dataService.sortCurrentState,
              searchCallback: handleSearch,
              backButtonCallback: handlePreviousState,
            ), // Atualiza o construtor do MyAppBar
          ),
          body: ValueListenableBuilder(
              valueListenable: dataService.tableStateNotifier,
              builder: (_, value, __) {
                switch (value['status']) {
                  case TableStatus.idle:
                    return const Center(child: Text("Toque em algum botão"));

                  case TableStatus.loading:
                    return const Center(child: CircularProgressIndicator());

                  case TableStatus.ready:
                    return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTableWidget(
                            jsonObjects: value['dataObjects'],
                            propertyNames: value['propertyNames'],
                            columnNames: value['columnNames'],
                          ),
                        ));

                  case TableStatus.error:
                    return const Text("Lascou");
                }

                return const Text("...");
              }),
          bottomNavigationBar:
              NewNavBar(itemSelectedCallback: dataService.load),
        ));
  }
}

class NewNavBar extends HookWidget {
  final _itemSelectedCallback;

  const NewNavBar({super.key, itemSelectedCallback})
      : _itemSelectedCallback = itemSelectedCallback ?? (int);

  @override
  Widget build(BuildContext context) {
    var state = useState(0);

    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          state.value = index;
          _itemSelectedCallback(index);
        },
        currentIndex: state.value,
        items: const [
          BottomNavigationBarItem(
            label: "Cafés",
            icon: Icon(Icons.coffee_outlined),
          ),
          BottomNavigationBarItem(
              label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
          BottomNavigationBarItem(
              label: "Nações", icon: Icon(Icons.flag_outlined)),
          BottomNavigationBarItem(
            label: "Weed",
            icon: Icon(Icons.forest),
          )
        ]);
  }
}

class DataTableWidget extends HookWidget {
  final List jsonObjects;
  final List<String> columnNames;
  final List<String> propertyNames;

  const DataTableWidget({super.key, 
    this.jsonObjects = const [],
    this.columnNames = const [],
    this.propertyNames = const [],
  });

  @override
  Widget build(BuildContext context) {
    final sortAsceding = useState(true);
    final sortColumnIndex = useState(1);
    return DataTable(
      sortAscending: sortAsceding.value,
      sortColumnIndex: sortColumnIndex.value,
      columns: columnNames
          .map((name) => DataColumn(
              onSort: (columnIndex, ascending) {
                sortColumnIndex.value = columnIndex;
                sortAsceding.value = !sortAsceding.value;
                dataService.sortCurrentState(
                    propertyNames[columnIndex], sortAsceding.value);
              },
              label: Expanded(
                  child: Text(name,
                      style: const TextStyle(fontStyle: FontStyle.italic)))))
          .toList(),
      rows: jsonObjects
          .map(
            (obj) => DataRow(
              cells: propertyNames
                  .map(
                    (propName) => DataCell(
                      Text(obj[propName]),
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }
  // List<DataRow> buildDataRows() {
  //   return jsonObjects.map((obj) {
  //     final cells = propertyNames
  //         .map((propName) => DataCell(Text(obj[propName])))
  //         .toList();
  //     return DataRow(cells: cells);
  //   }).toList();
  // }
}

class MyAppBar extends HookWidget {
  final callback;
  final searchCallback;
  final backButtonCallback;

  const MyAppBar({super.key, this.callback, this.searchCallback, this.backButtonCallback});

  @override
  Widget build(BuildContext context) {
    var state = useState(7);
    var searchState = useState('');

    return AppBar(
      title: Container(
        margin: const EdgeInsets.only(top: 2.0),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        constraints: const BoxConstraints(maxHeight: 40.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TextField(
          onChanged: (value) {
            searchState.value = value;
            if (searchState.value.length >= 3) {
              searchCallback(searchState.value);
            }
          },
          decoration: const InputDecoration(
            hintText: 'Digite algo...',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: backButtonCallback,
      ),
      actions: [
        PopupMenuButton(
          initialValue: state.value,
          itemBuilder: (_) => listNumbers
              .map(
                (num) => PopupMenuItem(
                  value: num,
                  child: Text("Carregar $num itens por vez"),
                ),
              )
              .toList(),
          onSelected: (number) {
            state.value = number;
            dataService.numberOfItems = number;
          },
        )
      ],
    );
  }
}
