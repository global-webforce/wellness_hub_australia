import 'package:wellness_hub_australia/features/offered_services/viewmodels/offered_services_viewmodel.dart';
import 'package:wellness_hub_australia/app/shared/ui/scaffold_body_wrapper.dart';
import 'package:wellness_hub_australia/features/offered_services/widgets/offered_service_form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AddOfferedServicePage extends StatelessWidget {
  const AddOfferedServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OfferedServicesViewModel>.reactive(
        viewModelBuilder: () => OfferedServicesViewModel(),
        onModelReady: (viewModel) async {
          await viewModel.getFields();
        },
        builder: (context, viewModel, child) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Add Offered Service"),
              ),
              body: ScaffoldBodyWrapper(builder: (context, constraints) {
                return const Card(
                  child: OfferedServiceForm(),
                );
              }));
        });
  }
}
