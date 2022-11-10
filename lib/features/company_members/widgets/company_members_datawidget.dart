import 'package:ez_ui/ez_ui.dart';
import 'package:wellness_hub_australia/app/shared/ui/syncfusion_datagrid_widgets.dart';
import 'package:wellness_hub_australia/models/client.model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CompanyMembersDataGridWidget extends StatelessWidget
    with DataGridWidgets {
  final DataGridSource source;

  const CompanyMembersDataGridWidget({Key? key, required this.source})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<GridColumn> buildColumns() {
      final col0 = columnCellBuilder(
        "id",
        "ID",
        maxWidth: 60,
      );
      final col1 = columnCellBuilder(
        "profilePicture",
        "Photo",
        alignment: Alignment.centerLeft,
        maxWidth: 100,
      );
      final col2 = columnCellBuilder(
        "fullname",
        "Full Name",
        alignment: Alignment.centerLeft,
      );

      return [
        col0,
        col1,
        col2,
      ];
    }

    return SfDataGrid(
      source: source,
      columns: buildColumns(),
      allowSorting: true,
      showSortNumbers: true,
      selectionMode: SelectionMode.single,
      navigationMode: GridNavigationMode.row,
      onSelectionChanged: (v, e) {},
      verticalScrollPhysics: const BouncingScrollPhysics(),
      allowPullToRefresh: true,
      columnWidthMode: ColumnWidthMode.fill,
      shrinkWrapRows: false,
      headerRowHeight: 40,
      rowHeight: 50,
    );
  }
}

class CompanyMembersDataGridSource extends DataGridSource with DataGridWidgets {
  /// Creates the company data source class with required details.
  List<DataGridRow> _companyData = [];

  CompanyMembersDataGridSource({required List<Client> companyData}) {
    _companyData = companyData
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell<int>(
                columnName: 'id',
                value: e.id,
              ),
              DataGridCell<String>(
                columnName: 'profile_picture',
                value: e.profilePic,
              ),
              DataGridCell<String>(
                columnName: 'fullname',
                value: "${e.firstName} ${e.lastName}",
              ),
            ],
          ),
        )
        .toList();
  }

  @override
  List<DataGridRow> get rows => _companyData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final col0 = rowCellBuilder(row.getCells()[0]);
    final col1 = rowCellBuilder(row.getCells()[1],
        alignment: Alignment.centerLeft, customBuilder: (e) {
      return EzAvatar(
        firstName: row.getCells()[2].value,
        imgUrl: row.getCells()[1].value,
        radius: 25,
      );
    });
    final col2 = rowCellBuilder(
      row.getCells()[2],
      alignment: Alignment.centerLeft,
    );

    return DataGridRowAdapter(
      cells: [
        col0,
        col1,
        col2,
      ],
    );
  }
}
