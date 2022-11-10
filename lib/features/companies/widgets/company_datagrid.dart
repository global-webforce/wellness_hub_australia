import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/app/shared/ui/syncfusion_datagrid_widgets.dart';
import 'package:wellness_hub_australia/features/company_members/pages/company_members_page.dart';
import 'package:wellness_hub_australia/models/company.model.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CompanyDataGridWidget extends StatelessWidget with DataGridWidgets {
  final DataGridSource source;

  const CompanyDataGridWidget({Key? key, required this.source})
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
        "name",
        "Name",
        alignment: Alignment.centerLeft,
      );
      final col2 = columnCellBuilder(
        "member_count",
        "Members",
        maxWidth: 250,
      );
      final col3 = columnCellBuilder(
        "payment_status",
        "Status",
        maxWidth: 250,
      );
      return [
        col0,
        col1,
        col2,
        col3,
      ];
    }

    return SfDataGrid(
      source: source,
      columns: buildColumns(),
      allowSorting: true,
      showSortNumbers: true,
      selectionMode: SelectionMode.single,
      navigationMode: GridNavigationMode.row,
      onSelectionChanged: (v, e) {
        print("You clicked ${v[0].getCells()[0].value}");
        final navigationService = locator<NavigationService>();
        navigationService.navigateToView(const CompanyMembersPage());
      },
      verticalScrollPhysics: const BouncingScrollPhysics(),
      allowPullToRefresh: true,
      columnWidthMode: ColumnWidthMode.fill,
      shrinkWrapRows: false,
      headerRowHeight: 40,
      rowHeight: 50,
    );
  }
}

class CompanyDataGridSource extends DataGridSource with DataGridWidgets {
  List<DataGridRow> _companyData = [];

  CompanyDataGridSource({required List<Company> companyData}) {
    _companyData = companyData
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell<int>(
                columnName: 'id',
                value: e.id,
              ),
              DataGridCell<String>(
                columnName: 'name',
                value: e.name,
              ),
              DataGridCell<int>(
                columnName: 'member_count',
                value: e.members.length,
              ),
              DataGridCell<String>(
                columnName: 'payment_status',
                value: e.paymentStatus,
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
      return Text(
        e.value,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontFamily: "Poppins",
        ),
      );
    });
    final col2 = rowCellBuilder(row.getCells()[2]);
    final col3 = rowCellBuilder(
      row.getCells()[3],
      customBuilder: (e) {
        Color color = Colors.transparent;
        switch (e.value) {
          case "Ongoing":
            color = Colors.blue;
            break;
          case "Finished":
            color = Colors.green;
            break;
          case "Missed":
            color = Colors.deepOrange;
            break;
          case "Cancelled":
            color = Colors.red;
            break;
          default:
        }
        return pill(e.value,
            foreground: color, background: color.withOpacity(0.2));
      },
    );

    return DataGridRowAdapter(
      cells: [
        col0,
        col1,
        col2,
        col3,
      ],
    );
  }
}
