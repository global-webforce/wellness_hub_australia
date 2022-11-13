import 'package:wellness_hub_australia/features/company_members/viewmodels/company_members_viewmodel.dart';
import 'package:wellness_hub_australia/features/company_members/widgets/company_members_datawidget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CompanyMembersPage extends StatelessWidget {
  final int? companyId;
  const CompanyMembersPage({Key? key, this.companyId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CompanyMembersViewModel>.reactive(
        viewModelBuilder: () => CompanyMembersViewModel(),
        onModelReady: (viewModel) async {
          await viewModel.getAll(companyId);
        },
        builder: (context, viewModel, child) {
          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text("Company Details"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Image.network(
                                "https://gwf-cors-anywhere.herokuapp.com/https://globalwebforce.com/wp-content/uploads/2021/06/cropped-nav-logo.png",
                                width: 200,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0,
                      ),
                      Expanded(
                        child: CompanyMembersDataGridWidget(
                          source: CompanyMembersDataGridSource(
                              companyData: viewModel.companyMembers),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
