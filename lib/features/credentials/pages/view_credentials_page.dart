import 'package:ez_ui/ez_ui.dart';
import 'package:wellness_hub_australia/app/shared/constants/dimensions.dart';
import 'package:wellness_hub_australia/app/shared/ui/empty_display.dart';
import 'package:wellness_hub_australia/features/credentials/viewmodels/credentials_viewmodel.dart';
import 'package:wellness_hub_australia/features/credentials/widgets/credential_card.dart';
import 'package:wellness_hub_australia/app/shared/ui/list_gridview_wrapper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stacked/stacked.dart';

class ViewCredentialsPage extends StatelessWidget {
  const ViewCredentialsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CredentialsViewModel>.reactive(
        viewModelBuilder: () => CredentialsViewModel(),
        onModelReady: (viewModel) async {
          await viewModel.getAll();
        },
        builder: (context, viewModel, child) {
          final credentials = viewModel.credentials;
          print("AM I BUSY ${viewModel.isBusy}");

          Widget addButton() {
            return Container(
              padding: const EdgeInsets.all(15),
              color: Theme.of(context).cardTheme.color,
              child: SizedBox(
                height: 40,
                child: EzButton.elevated(
                  leading: Icons.add,
                  title: "ADD CREDENTIAL",
                  onTap: () => viewModel.goToAddPage(),
                  rounded: true,
                ),
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text("Manage Credentials"),
            ),
            bottomNavigationBar: addButton(),
            body: ListGridViewWrapper(
              isBusy: viewModel.isBusy,
              emptyIndicatorWidget: const EmptyDisplay(
                icon: Icons.file_present_rounded,
                title: "YOUR CREDENTIALS HERE",
                subtitle:
                    "Show to your customers that you have the knowledge and skills to perform your professional function.",
              ),
              onRefresh: () async {
                await viewModel.getAll();
              },
              itemCount: credentials.length,
              builder: (context, constraints) {
                return AlignedGridView.count(
                  padding: Dimens.sliverPadding800(constraints),
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  itemCount: credentials.length,
                  itemBuilder: (context, index) {
                    return CredentialCard(
                      credential: credentials[index],
                      onTap: () {},
                      onTapDelete: () async {
                        await viewModel.delete(credentials[index].id);
                      },
                    );
                  },
                );
              },
            ),
          );
        });
  }
}
