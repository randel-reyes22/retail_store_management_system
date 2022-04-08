import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderList createState() => _OrderList();
}

class _OrderList extends State<OrderList> {
  var _sortAscending = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            width: (MediaQuery.of(context).size.width),
            height: (MediaQuery.of(context).size.height),
            child: PaginatedDataTable(
              showCheckboxColumn: false,
              showFirstLastButtons: true,
              sortAscending: _sortAscending,
              sortColumnIndex: 1,
              rowsPerPage: 9,
              columns: [
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Adress')),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Info')),
                DataColumn(label: Text('Take Order')),
              ],
              source: _DataSource(context),
            ),
          ),
        ),
      ],
    );
  }
}

class _Row {
  _Row(
    this.valueName,
    this.valueAddress,
    this.valueStatus,
    this.valueInfo,
    this.valueTakeOrder,
  );

  final String valueName;
  final String valueAddress;
  final String valueStatus;
  final Widget valueInfo;
  final Widget valueTakeOrder;

  bool selected = false;
}

class _DataSource extends DataTableSource {
  _DataSource(this.context) {
    _paymentsList(context);
  }

  final BuildContext context;

  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _paymentsList(context).length) return null;
    final row = _paymentsList(context)[index];
    return DataRow.byIndex(
      index: index,
      selected: row.selected,
      onSelectChanged: (value) {
        if (row.selected != value) {
          var value = false;
          _selectedCount += value ? 1 : -1;
          assert(_selectedCount >= 0);
          row.selected = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(Text(row.valueName)),
        DataCell(Text(row.valueAddress)),
        DataCell(Text(row.valueStatus)),
        DataCell((row.valueInfo)),
        DataCell((row.valueTakeOrder)),
      ],
    );
  }

  @override
  int get rowCount => _paymentsList(context).length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

List<_Row> _paymentsList(BuildContext context) {
  try {
    return List.generate(
      4,
      (index) {
        return _Row(
          'Data 1',
          'Data 2',
          'Data 3',
          TextButton(
            onPressed: () {},
            child: Text('Info'),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Take order'),
          ),
        );
      },
    );
  } catch (e) {
    //if borrowers list is empty
    return List.generate(0, (index) {
      return _Row(
        '',
        '',
        '',
        Text(''),
        Text(''),
      );
    });
  }
}
