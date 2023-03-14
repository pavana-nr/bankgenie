import 'dart:math';

import 'package:flutter/material.dart';

class DataTablePage extends StatefulWidget {
  const DataTablePage({Key? key, required this.officeDetails})
      : super(key: key);
  final List officeDetails;
  @override
  State<DataTablePage> createState() => _DataTablePageState();
}

class _DataTablePageState extends State<DataTablePage> {
  final DataTableSource _data = MyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          PaginatedDataTable(
            source: _data,
            header: const Text('Office table'),
            columns: const [
              DataColumn(label: Text('Office name')),
              DataColumn(label: Text('External Id')),
              DataColumn(label: Text('Parent office')),
              DataColumn(label: Text('Opened on')),
            ],
            columnSpacing: 100,
            horizontalMargin: 10,
            rowsPerPage: 8,
            showCheckboxColumn: false,
          ),
        ],
      ),
    );
  }
}

// The "soruce" of the table
class MyData extends DataTableSource {
  // Generate some made-up data
  final List<Map<String, dynamic>> _data = List.generate(
      200,
      (index) => {
            "id": index,
            "title": "Item $index",
            "price": Random().nextInt(10000),
            "opened": Random().nextInt(10000)
          });

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["price"].toString())),
      DataCell(Text(_data[index]["opened"].toString())),
    ]);
  }
}
