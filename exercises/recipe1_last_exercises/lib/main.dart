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
      appBar: AppBar(
        title: const Text('Cervejas'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Nome',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Estilo',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'IBU',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: const <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('La Fin Du Monde')),
                  DataCell(Text('Bock')),
                  DataCell(Text('65')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Sapporo Premium')),
                  DataCell(Text('Sour Ale')),
                  DataCell(Text('54')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Duvel')),
                  DataCell(Text('Pilsner')),
                  DataCell(Text('82')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('IPA')),
                  DataCell(Text('India Pale Ale')),
                  DataCell(Text('70')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Stella Artois')),
                  DataCell(Text('Pilsner')),
                  DataCell(Text('40')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Paulaner')),
                  DataCell(Text('Weissbier')),
                  DataCell(Text('12')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Guinness')),
                  DataCell(Text('Stout')),
                  DataCell(Text('45')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Skoll')),
                  DataCell(Text('Desce redonda')),
                  DataCell(Text('10')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Brahma')),
                  DataCell(Text('Aquela lá')),
                  DataCell(Text('40')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Heineken')),
                  DataCell(Text('Verde')),
                  DataCell(Text('24')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Corona')),
                  DataCell(Text('amarela')),
                  DataCell(Text('40')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Budweiser')),
                  DataCell(Text('Teste')),
                  DataCell(Text('10')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Antartica')),
                  DataCell(Text('gelada')),
                  DataCell(Text('90')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Schin')),
                  DataCell(Text('não sei')),
                  DataCell(Text('73')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Alguma cerveja')),
                  DataCell(Text('teste')),
                  DataCell(Text('20')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
