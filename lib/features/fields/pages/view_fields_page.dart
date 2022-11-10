import 'package:wellness_hub_australia/features/fields/viewmodels/fields_viewmodel.dart';
import 'package:wellness_hub_australia/features/fields/widgets/field_card.dart';
import 'package:wellness_hub_australia/app/shared/ui/list_gridview_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stacked/stacked.dart';

class ViewFieldsPage extends StatelessWidget {
  const ViewFieldsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Fields"),
      ),
      body: ViewModelBuilder<FieldsViewModel>.reactive(
        viewModelBuilder: () => FieldsViewModel(),
        onModelReady: (viewModel) async {
          await viewModel.getAll();
        },
        builder: (context, viewModel, child) {
          final fields = viewModel.fields;
          return ListGridViewWrapper(
            isBusy: viewModel.isBusy,
            onRefresh: () async {
              await viewModel.getAll();
            },
            itemCount: fields.length,
            builder: (context, constraints) {
              return AlignedGridView.count(
                padding: const EdgeInsets.all(15),
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                itemCount: fields.length,
                itemBuilder: (context, index) {
                  return FieldCard(
                    field: fields[index],
                    onTap: () {},
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
