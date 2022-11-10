import 'package:wellness_hub_australia/features/credentials/viewmodels/credentials_viewmodel.dart';
import 'package:wellness_hub_australia/app/shared/ui/scaffold_body_wrapper.dart';
import 'package:wellness_hub_australia/features/credentials/widgets/credential_form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AddCredentialPage extends StatelessWidget {
  const AddCredentialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CredentialsViewModel>.reactive(
        viewModelBuilder: () => CredentialsViewModel(),
        onModelReady: (viewModel) async {},
        builder: (context, viewModel, child) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Add Credential"),
              ),
              body: ScaffoldBodyWrapper(
                  onRefresh: () async {},
                  builder: (context, constraints) {
                    return const Card(
                      child: CredentialForm(),
                    );
                  }));
        });
  }
}
